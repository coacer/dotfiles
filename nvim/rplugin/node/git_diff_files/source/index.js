const util = require('../util');

module.exports = plugin => {
  const { echoSuccess, echoAlert, echoErr, input, execute, executeList, makeSession } = util(plugin);

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
   * @return Promise<Object> { dir: string, branch1: string, branch2: string }
   * @throws Error
   */
  const inputValues = async () => {
    const dir = await input("Please input target directory: ");
    const branch1 = await input("Please input branch name: ");
    const branch2 = branch1 ? '' : await input("Please input another branch name: ");
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

  const createDiffList = (dir, branch1, branch2) => {

  };


  return {
    isGitRepo,
    inputValues,
    setSession,
  }
};
