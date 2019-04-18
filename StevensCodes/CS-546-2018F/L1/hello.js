let message = "Hello, world";
console.log(message);
const x1 = 1;   //no reassign 
let x2 = 2;     //may reassign
var x3 = 3;     //nothing defined. not Rec
console.log(x1 +" "+ x2 +" "+ x3 +"\n\n");


let string1 = "This is the first string; it's block scoped.";
const string2 = "This is the second string; it is a constant.";
// NOTE: SOME AUTO FORMATTERS WILL CONVERT THESE TO DOUBLE QUOTES:
var string3 = 'This is the "third string"; it\'s functionally scoped';
//Templated string
let string4 = `string1 is: 
${string1} after some newlines`;

console.log(string1);
console.log(string2);
console.log(string3);
console.log(string4+"\n\n");


string1 = "This is the first string, again; it should still be block scoped";
console.log(string1);

let string5 = "Hello, my name is ";
string5 = string5 + "Phil Barresi!";
console.log(string5);

console.log(string5.length);
console.log(string5.split(" ") + "\n\n");


//check equality better with '===' than '==' 
//b/c '===' is checking both type and value
 
function myGlobalFunction() {
    console.log("This is a global function.");
}
myGlobalFunction();

let myAnonymousDouble = function(x) {
    return x * 2;
};
console.log(myAnonymousDouble(2));

//use this over normal anonymous functions
let doubleUp = x => {
    return x * 2;
};
console.log(doubleUp(4) + "\n\n");


let myStringArray = ["hello", "world", "my", "name", "is", "Phil"];
//A callback is simply a function that another function runs.
// traverse arrays with forEach
myStringArray.forEach(value => {
    console.log(value);
});

let myNumArray = [1, 2, 3, 4, 5];
//transform entries into a new array of results with map
let myNumArraySquared = myNumArray.map(x => {
  return x * x;
});
console.log(myNumArray);
console.log(myNumArraySquared);

//select a subset of elements from an 
//array based on a condition using filter
let oddNumbers = myNumArray.filter(num => {
  return num % 2 === 1;
});
console.log(myNumArray);
console.log(oddNumbers);

//accumulate each array entry for a final result using reduce
let sumOfOdds = oddNumbers.reduce((currentTotal, newValue) => {
  const newTotal = currentTotal + newValue;
  return newTotal;
}, 0);

console.log(sumOfOdds);

myNumArray.push(6);
console.log(myNumArray.join(" "));