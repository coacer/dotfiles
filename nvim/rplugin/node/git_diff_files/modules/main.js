const util = require('./util');

module.exports = plugin => {
  const {
    echoSuccess,
    echoAlert,
    echoErr,
    input,
    execute,
    executeList,
    makeSession,
    setQuickFixList,
  } = util(plugin);

  /**
   * gitリポジトリ配下かどうか判定
   * @return boolean
   */
  const isGitRepo = async () => {
    try {
      // リポジトリ配下でない場合標準エラー出力(例外)される
      const stdout = await execute('git status');
      if (stdout) return true;
    } catch (e) {
      console.log(e);
      return false;
    }
  };

  /**
   * 正常なブランチか判断
   * @param string branch1 ブランチ名
   * @param string branch2 ブランチ名
   * @return Promise<boolean> 両方とも正常なブランチだった場合trueを返す
   */
  const isValidBranches = async (branch1, branch2) => {
    const validBranches = await executeList('git branch -a');
    // HEADも許容する
    validBranches.push('head', 'HEAD');
    const isValidBranch1 = validBranches.includes(branch1);
    const isValidBranch2 = validBranches.includes(branch2);
    return isValidBranch1 && isValidBranch2;
  };

  /**
   * プロンプトを表示して入力させる
   * @return Promise<Object> { dir: string, branch1: string, branch2: string } | boolean プロンプト入力を中断した場合falseを返す
   * @throws Error
   */
  const inputValues = async () => {
    let dir = null;
    let branch1 = null;
    let branch2 = null;

    try {
      dir = await input("Please input target directory: ");
      branch1 = await input("Please input branch name: ");
      branch2 = branch1 ? await input("Please input another branch name: ") : '';
    } catch (e) {
      console.log(e);
      return false
    }
    if (!branch1 && !isValidBranches(branch1, branch2)) {
      throw new Error("Invalid branch name");
    }

    return { dir, branch1, branch2 };
  };

  /**
   * vimセッションを保持する
   */
  const setSession = () => {
    const sessionFile = '.git_diff_tmp.vim';
    makeSession(sessionFile);
    plugin.nvim.command('silent! wincmd o');
  }

  /**
   * バッファに対してマッピング設定
   */
  const setMappings = () => {
    plugin.nvim.command('nnoremap <buffer> <silent> q :GitDiffFin<CR>');
    plugin.nvim.command('nnoremap <buffer> <C-n> :<C-u>GitDiffNext<CR>');
    plugin.nvim.command('nnoremap <buffer> <C-p> :<C-u>GitDiffPrevious<CR>');
    plugin.nvim.command('nnoremap <buffer> <C-j> :<C-u>call GitDiffJump(v:count)<CR>');
  };

  /**
   * git diffの結果からQuickfix作成
   * @param string dir
   * @param string branch1
   * @param string branch2
   */
  const createDiffList = async (dir, branch1, branch2) => {
    const br1 = branch1 === 'head' ? 'HEAD' : branch1;
    const br2 = branch2 === 'head' ? 'HEAD' : branch2;
    let diffList = await executeList(`git diff --name-only ${br1} ${br2}`);

    const rootDir = (await execute('git rev-parse --show-toplevel')).trim() + '/';
    // ディレクトリ指定があった場合はfilterにかける
    if (dir) {
      const rgx = new RegExp(`^${dir}.*$`);
      diffList = diffList.filter(val => rgx.test(val));
    }

    const files = [];
    diffList.forEach((val, lnum) => {
      let filename = rootDir + val;
      let info = { filename, lnum, text: '✗' }
      files.push(info);
    });

    if (files.length <= 0) throw new Error('Not found difference or directory');

    setQuickFixList(files);
    // quickfix window表示
    plugin.nvim.command('cwindow');
    // 一番最初のバッファに初期化
    plugin.nvim.command('cfirst');
    setMappings();
  };

  /**
   * diffを表示+マッピング
   */
  const executeDiff = async () => {
    const { nvim } = plugin;

    plugin.nvim.command('Gdiff');
    // ウィンドウ2つのバッファに対してマッピング設定
    const windows = await nvim.windows;
    nvim.window =  windows[0];
    setMappings();
    nvim.window =  windows[1];
    setMappings();
  };


  return {
    isGitRepo,
    inputValues,
    setSession,
    createDiffList,
    executeDiff,
  }
};
