const util = require('./util');
const main = require('./main');

module.exports = plugin => {
  const { echoErr, input } = util(plugin);
  const { executeDiff } = util(plugin);

  /**
   * 引数のbufferにジャンプ
   * @param number|string bufNum
   */
  const jumpFile = (bufNum = null) => {
    const { command } = plugin.nvim;

    if (bufNum === null) {
      bufNum = await input('Please input jump numbrer: ');
    }

    // フォーカスするウィンドウ初期化
    const windows = plugin.nvim.windows;
    plugin.nvim.window = windows[0];

    try {
      if (bufNum === 'next') {
        command('cnext');
      } else if (bufNum === 'pre') {
        command('cprevious');
      } else {
        command(`cc! ${bufNum}`);
      }
    } catch (e) {
      console.log(e);
      echoErr('Bad argument');
    }

    executeDiff();
  };

  const finishDiffSession = () => {
    const { command } = plugin.nvim;

    command('%bdelete');
    // command(`source`)
  };

  return {
    jumpFile,
  };
}
