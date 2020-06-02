#!/usr/bin/env node
const axios = require('axios');
const fs = require('fs');

const changeStr = argv => {
  let str = '';
  argv.forEach((value, index) => {
    switch (index) {
      case 0:
      case 1:
        break;
      case 2:
        str += value;
        break;
      default:
        str += ',' + value;
        break;
    }
  });
  return str;
};

const target = changeStr(process.argv);
axios.get(`https://www.gitignore.io/api/${target}`)
  .then(res => {
    fs.writeFileSync('.gitignore', res.data);
    console.log('create successfully!');
  })
  .catch(e => console.log(e.message));

