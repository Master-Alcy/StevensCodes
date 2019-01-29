const uuidv4 = require('uuid/v4');
const mock = require('mockjs');
const Random = mock.Random;
let aaa = Random.boolean();

// console.log( Random.name());
// console.log( Random.name());
// console.log( Random.name());
// console.log( Random.boolean());
// console.log(uuidv4());
let x = "11111111", y = "abcd", z = "2.22222";

x = parseInt(x);
y = parseInt(y);
z = parseInt(z);

function isNumeric(n) {
    return !isNaN(parseFloat(n)) && isFinite(n);
}

console.log(x + " --- " + isNumeric(x));
if (!y) {
    console.log("y not exist")
}
console.log(y + " --- " + isNumeric(y));
console.log(z + " --- " + isNumeric(z));