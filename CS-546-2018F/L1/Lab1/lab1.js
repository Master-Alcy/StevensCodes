const questionOne = function questionOne(arr) {
    let sum = arr.reduce((currentToT, newValue) =>{
        const newTotal = currentToT + newValue * newValue;
        return newTotal;
    }, 0);
    return sum;
}

const questionTwo = function questionTwo(num) { 
    let Fib = num => {
        if (num < 1) {
            return 0;
        }else if (num === 1) {
            return 1;
        }else {
            return Fib(num - 1) + Fib(num - 2);
        }
    };
    return Fib(num);
}

const questionThree = function questionThree(text) {
    // a,e,i,o,u
    function numVowels (str) {
        //g means search whole str, i means case insensitive
        let match = str.match(/[aeiou]/gi);
        if (match === null) {
            return 0;
        }else {
            return match.length;
        }
    }
    return numVowels(text);
}

const questionFour = function questionFour(num) {
    let fact = x => {
        if (x < 0) {
            return NaN;
        }else if (x === 0) {
            return 1;
        }else {
            return x * fact(x - 1);
        }
    };
    return fact(num);
}

module.exports = {
    firstName: "Jingxuan", 
    lastName: "Ai", 
    studentId: "10431517",
    questionOne,
    questionTwo,
    questionThree,
    questionFour
};