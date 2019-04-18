const promiseThatReturnsTen = Promise.resolve(10);

const promiseThatReturnsTwenty = promiseThatReturnsTen
.then(function(result) {
    // result is 10
    return result * 2;
});

const promiseThatReturnsFifty = promiseThatReturnsTwenty
.then(function(result) {
    return result * 2.5;
});

// Logs 50
promiseThatReturnsFifty.then(console.log);

const bluebird = require("bluebird");
const Promise = bluebird.Promise;

// We use bluebird to make a copy of fs
// that has all its normal methods, and
// {methodName}Async method versions that return
// promises as well; ie, you will have a copy
// of fs with fs.stat(path, callback) and
// fs.statAsync(path), which returns a promise
// thus allowing us to await it.
const fs = bluebird.promisifyAll(require("fs"));

async function getFileSizeInKilobytes(path) {
  // Throwing inside of an async method causes the method
  // To return a rejected promise, which means we can throw based
  // On arguments
  if (!path) throw "You must provide a path";
  const stats = await fs.statAsync(path);

  return stats.size / 1024;
}

async function main() {
    // We can await this; if it throws / rejects
  const kilos = await getFileSizeInKilobytes("./hello.txt");
  console.log(`That file is ${kilos}kb large!`);
}

main();