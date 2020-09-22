const util = require('./modules/util');
const main = require('./modules/main');
const operations = require('./modules/operations');

module.exports = plugin => {
  plugin.setOptions({ dev: true, alwaysInit: true });
  const { echoMsg, echoErr } = util(plugin);
  const { isGitRepo, inputValues, setSession, createDiffList, executeDiff } = main(plugin);
  const { jumpFile, finishDiffSession } = operations(plugin);

  const init = async () => {
    try {
      const isNotGitRepo = !(await isGitRepo());
      if (isNotGitRepo) throw new Error("Not a git repository");

      const result = await inputValues();
      // 入力を中断した場合終了
      if (!result) {
        return echoMsg('git diff aborted');
      }

      const { dir, branch1, branch2 } = result;
      setSession();
      await createDiffList(dir, branch1, branch2);
      await executeDiff();
    } catch (e) {
      console.log(e);
      await finishDiffSession();
      echoErr(e);
    }
  }

  // command設定
  plugin.registerCommand('GitDiffFilesV2', init);
  plugin.registerCommand('GitDiffNextV2', jumpFile('next'));
  plugin.registerCommand('GitDiffPreviousV2', jumpFile('pre'));
  plugin.registerCommand('GitDiffJumpV2', jumpFile());
  plugin.registerCommand('GitDiffFinV2', finishDiffSession);
};

