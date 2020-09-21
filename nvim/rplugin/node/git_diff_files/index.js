const util = require('./util');
const source = require('./source');

module.exports = plugin => {
  plugin.setOptions({ dev: true, alwaysInit: true });
  const { echoErr } = util(plugin);
  const { isGitRepo, inputValues, setSession } = source(plugin);

  const init = async () => {
    try {
      const isNotGitRepo = !(await isGitRepo());
      if (isNotGitRepo) throw new Error("Not a git repository");

      const { dir, branch1, branch2 } = await inputValues();
      setSession();
      console.log(dir);
      console.log(branch1);
      console.log(branch2);
      // createDiffList(dir, branch1, branch2);
      // executeDiff();
    } catch (e) {
      console.log(e);
      echoErr(e);
    }
  }
  plugin.registerCommand('GitDiffFiles2', init);
};

