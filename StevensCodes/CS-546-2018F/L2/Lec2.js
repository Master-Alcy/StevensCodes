/*
npm install PACKAGENAME --save
You must include --save to save it to your package.json file
Points will be deducted if you do not save all your dependencies.
npm install
don't submit node_modules folder
“scripts”: {
“start”: “node app.js”,
“test”: “node test.js”
}
run with 'npm start' 'npm test'

git clone https://github.com/Stevens-CS546/CS-546.git

require, module, module.exports

Modules allow for many great things:
◦ You can strictly define what code is exported to be used, allowing you to make entire files with a
defined structure
◦ You can change the internal workings of a module to make it more performant and add more features
while not updating external code.

◦ Check that arguments are provided (check if undefined)
◦ Check that arguments are of the expected type (use typeof operator)
◦ Check that arguments are within proper bounds (i.e., if you are writing a division method, make sure
that you cannot divide by 0)

use 'throw' for error
*/

/*
try {
    myroutine();
}catch (e){
    if (e instanceof TypeError){
        //statements to handle this
    }else if  (e instanceof RangeError){
        //statements to handle this
    }else if  (e instanceof EvalError){
         //statements to handle this
    }else {
         //statements to handle this
        logMyErrors(e);
    }
}
*/

/*
addTwoNumbers(first, second)
◦ Check that you are provided with 2 numbers
subtractTwoNumbers(first, second)
◦ Check that you are provided with 2 numbers
multiplyTwoNumbers(first, second)
◦ Check that you are provided with 2 numbers
divideTwoNumbers(numerator, denominator)
◦ Check that you are provided with 2 numbers
◦ Check that denominator is not 0
*/

/*
exports / module.exports global_object.
const calc = require('./calculator.js')
*/
 function addTwoNum (num1, num2) {

 }

 function divideTwoNum (num1, num2) {

 }

 let addnum = addTwoNum (12, 10);
 let division = divideTwoNum (420, 0);

