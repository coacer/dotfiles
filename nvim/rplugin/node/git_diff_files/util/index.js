const { exec } = require('child_process');

module.exports = plugin => {
  /**
   * 標準メッセージ関数
   * @param string msg
   */
  const echoMsg = msg => plugin.nvim.command(`echo "${msg}"`);

  /**
   * successメッセージ関数
   * @param string msg
   */
  const echoSuccess = msg => plugin.nvim.call('EchoSuccess', msg);

  /**
   * alertメッセージ関数
   * @param string msg
   */
  const echoAlert = msg => plugin.nvim.call('EchoAlert', msg);

  /**
   * errorメッセージ関数
   * @param string msg
   */
  const echoErr = msg => {
    if (typeof(msg) !== 'string') {
      msg = msg.toString();
    }
    console.log('==== echoerr ====');
    console.log(typeof(msg) !== 'string');
    plugin.nvim.call('EchoErr', msg);
  }
  /**
   * プロンプト表示関数
   * @param string prompt
   * @return Promise
   */
  const input = async prompt => await plugin.nvim.call('input', prompt);

  /**
   * Linuxコマンド実行関数
   * @param string cmd
   * @return Promise<string> resolveした場合標準出力結果を返す
   */
  const execute = cmd => (
    new Promise((resolve, reject) => {
      exec(cmd, (err, stdout, stderr) => {
        if (err) {
          reject(err);
        } else if (stderr) {
          reject(stderr);
        } else {
          resolve(stdout);
        }
      });
    })
  );

  /**
   * Linuxコマンド実行結果を配列化して返す
   * @param string cmd
   * @return Promise<array>
   */
  const executeList = async cmd => {
    try {
      const result = await execute(cmd);
      return result.split('\n');
    } catch (e) {
      throw e;
    }
  };

  /**
   * vimセッションを作成
   * @param string file
   */
  const makeSession = file => {
    plugin.nvim.command(`mksession! ${file}`);
  };

  /**
   * QuickFixリストを作成
   * @param array list [{filename, lnum, text}]
   */
  const setQuickFixList = list => {
    plugin.nvim.call('setqflist', [list]);
  }

  return {
    echoMsg,
    echoSuccess,
    echoAlert,
    echoErr,
    input,
    execute,
    executeList,
    makeSession,
    setQuickFixList,
  };
}
