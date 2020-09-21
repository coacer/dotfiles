const { exec } = require('child_process');

exec('ls', (err, stdout, stderr) => {
  const str = stdout.split('\n').join();
  console.log(str);
});

