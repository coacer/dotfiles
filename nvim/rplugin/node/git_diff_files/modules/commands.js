module.exports = app => {
  app.plugin.registerCommand('HelloNodejs', [app, app.helloNode]);
};
