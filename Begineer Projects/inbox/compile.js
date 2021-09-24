const path = require('path');
// this is standard library module to get path of a file from this file
// we use it instead of giving manually the path to achieve cross platform independencies

const fs = require('fs');
// this is file system library module we use it read a file from a given path
const solc = require('solc');
// this is used to invoke compiler that we installed using npm install --save solc

const inboxPath = path.resolve(__dirname,'contracts','inbox.sol');
// here we create a path from this file to .sol file, first we come to cur working directory
// using __dirname, then we have to go to contracts then to inbox.sol 
const source = fs.readFileSync(inboxPath,'utf8');
// finally we read the inbox.sol file

module.exports = solc.compile(source,1).contracts[':inbox'];