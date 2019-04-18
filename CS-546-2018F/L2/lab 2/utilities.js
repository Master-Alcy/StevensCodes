function deepEquality(obj1, obj2) {
    if (arguments.length === 2) {
        if (typeof obj1 !== "object") {
            throw "First argument is not of 'object' type.";
        }
        if (typeof obj2 !== "object") {
            throw "Second argument is not of 'object' type.";
        }
    } else {
        throw "Wrong number of arguments. Should be 2. We have " + arguments.length + ".";
    }

    if (JSON.stringify(obj1) === JSON.stringify(obj2)){
        return true;
    }
    return false
}

function uniqueElements(arr) {
    if (arguments.length === 1) {
        if (!Array.isArray(arr)) {
            throw "The argument is not an array.";
        }
    } else {
        throw "Wrong number of arguments. Should be 1. We have " + arguments.length + ".";
    }

    const uniqueValues = [...new Set(arr)]; 
    return uniqueValues.length;
}

function countOfEachCharacterInString (str) {
    if (arguments.length === 1) {
        if (typeof str !== "string") {
            throw "The argument is not a string.";
        }
    } else {
        throw "Wrong number of arguments. Should be 1. We have " + arguments.length + ".";
    }

    let arr = str.split("");
    let obj = {};
    arr.forEach (function(s) {
        obj[s] = (obj[s] || 0) + 1;
    });
    return obj;
}

module.exports = {
    description: "This is a utilities for cs-546-lab2.",
    deepEquality,
    uniqueElements,
    countOfEachCharacterInString
};