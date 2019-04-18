const geoCalc = require ("./geometry");
const util = require("./utilities");

console.log("Test 'geometry.js': \n");
console.log("Test volumeOfRectangularPrism 5 times:");
console.log(geoCalc.volumeOfRectangularPrism(4,2,3));
console.log(geoCalc.volumeOfRectangularPrism(1,2,4));
console.log(geoCalc.volumeOfRectangularPrism(9,6,5));
console.log(geoCalc.volumeOfRectangularPrism(2,2,2));
console.log(geoCalc.volumeOfRectangularPrism(1,1,1));
console.log("Test surfaceAreaOfRectangularPrism 5 times:");
console.log(geoCalc.surfaceAreaOfRectangularPrism(2,3,3));
console.log(geoCalc.surfaceAreaOfRectangularPrism(22,3,4));
console.log(geoCalc.surfaceAreaOfRectangularPrism(1,1,1));
console.log(geoCalc.surfaceAreaOfRectangularPrism(2,7,4));
console.log(geoCalc.surfaceAreaOfRectangularPrism(2,3,9));
console.log("Test volumeOfSphere 5 times:");
console.log(geoCalc.volumeOfSphere(1));
console.log(geoCalc.volumeOfSphere(2));
console.log(geoCalc.volumeOfSphere(3));
console.log(geoCalc.volumeOfSphere(4));
console.log(geoCalc.volumeOfSphere(5));
console.log("Test surfaceAreaOfSphere 5 times:");
console.log(geoCalc.surfaceAreaOfSphere(1));
console.log(geoCalc.surfaceAreaOfSphere(2));
console.log(geoCalc.surfaceAreaOfSphere(3));
console.log(geoCalc.surfaceAreaOfSphere(4));
console.log(geoCalc.surfaceAreaOfSphere(5));

console.log("\nTest 'utilities.js': \n");
const first = {a: 2, b: 3};
const second = {a: 2, b: 4};
const third = {a: 2, b: 3};
const forth = {a: 1, b: 5};
const testArr1 = ["a", "a", "b", "a", "b", "c"];
const testArr2 = ["d", "a", "b", "a", "b", "c"];
const testArr3 = ["d", "d", "b", "a", "b", "c"];
const testArr4 = ["e", "f", "b", "a", "b", "c"];
const testArr5 = ["a", "e", "b", "a", "b", "c"];
const test1 = "Hello, the pie is in the oven";
const test2 = "Hello, the pie is in";
const test3 = "Hello, the pie";
const test4 = "Hello, the ";
const test5 = "Hello";

console.log("Test deepEquality 5 times:");
console.log(util.deepEquality(first, second));  // false
console.log(util.deepEquality(first, third));   //true
console.log(util.deepEquality(second, third));   //false
console.log(util.deepEquality(first, forth));   //false
console.log(util.deepEquality(second, third));   //false
console.log("Test uniqueElements 5 times:");
console.log(util.uniqueElements(testArr1));      //3
console.log(util.uniqueElements(testArr2));      //4
console.log(util.uniqueElements(testArr3));      //4
console.log(util.uniqueElements(testArr4));      //5
console.log(util.uniqueElements(testArr5));      //4
console.log("Test countOfEachCharacterInString 5 times:");
console.log(util.countOfEachCharacterInString(test1));
console.log(util.countOfEachCharacterInString(test2));
console.log(util.countOfEachCharacterInString(test3));
console.log(util.countOfEachCharacterInString(test4));
console.log(util.countOfEachCharacterInString(test5));