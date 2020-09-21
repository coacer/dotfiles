const util = require('./modules/util');
const main = require('./modules/main');

module.exports = plugin => {
  plugin.setOptions({ dev: true, alwaysInit: true });
  const { echoMsg, echoErr } = util(plugin);
  const { isGitRepo, inputValues, setSession, createDiffList, executeDiff } = main(plugin);

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
      echoErr(e);
    }
  }
  plugin.registerCommand('GitDiffFilesV2', init);
};

