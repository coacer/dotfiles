const util = require('./util');
const main = require('./main');

module.exports = plugin => {
  const { echoErr, input, execute } = util(plugin);
  const { executeDiff } = main(plugin);

  /**
   * 引数のbufferにジャンプ
   * @param number|string bufNum
   */
  const jumpFile = (bufNum = null) => async () => {

    if (bufNum === null) {
      bufNum = await input('Please input jump numbrer: ');
    }

    // フォーカスするウィンドウ初期化
    const windows = await plugin.nvim.windows;
    plugin.nvim.window = windows[0];
    plugin.nvim.command('wincmd c');

    // バッファIDを取得
    const qflist = await plugin.nvim.call('getqflist');
    const firstBufId = qflist[0].bufnr;
    const lastBufId = qflist.slice(-1)[0].bufnr;
    const currentBufId = await plugin.nvim.buffer.id;

    const isFirst = currentBufId === firstBufId;
    const isLast = currentBufId === lastBufId;

    try {
      let cmd = null;
      switch (bufNum) {
        case 'next':
          cmd = isLast ? 'cfirst' : 'cnext';
          break;
        case 'pre':
          cmd = isFirst ? 'clast' : 'cprevious';
          break;
        default:
          cmd = `cc! ${bufNum}`;
          break;
      }
      plugin.nvim.command(cmd);
    } catch (e) {
      console.log(e);
      echoErr('Bad argument');
    }

    executeDiff();
  };

  /**
   * 終了関数
   */
  const finishDiffSession = async () => {
    plugin.nvim.command('%bdelete');
    const sessionFile = await plugin.nvim.getVar('git_diff_file_session');
    console.log(sessionFile);
    console.log(!require('fs').existsSync(sessionFile));
    // セッションファイルが存在しない場合は何もしない
    if (!sessionFile || !require('fs').existsSync(sessionFile)) return;

    plugin.nvim.command(`source ${sessionFile}`);
    await execute(`rm ${sessionFile}`);
  };


  return {
    jumpFile,
    finishDiffSession,
  };
}
