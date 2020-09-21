const { exec } = require('child_process');

module.exports = plugin => {
  /**
   * successメッセージ関数
   * @param string msg
   */
  const echoSuccess = msg => plugin.nvim.command(`call EchoSuccess("${msg}")`);

  /**
   * alertメッセージ関数
   * @param string msg
   */
  const echoAlert = msg => plugin.nvim.command(`call EchoAlert("${msg}")`);

  /**
   * errorメッセージ関数
   * @param string msg
   */
  const echoErr = msg => plugin.nvim.command(`call EchoErr("${msg}")`);

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

  return {
    echoSuccess,
    echoAlert,
    echoErr,
    input,
    execute,
    executeList,
    makeSession,
  };
}
