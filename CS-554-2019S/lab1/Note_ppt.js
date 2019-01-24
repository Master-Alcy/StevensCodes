"use strict";

function resolveAfter2Seconds(x) {
    return new Promise(resolve => {
        setTimeout(() => {
            resolve(x);
        }, 2000);
    });
}

async function add1(x) {
    let a = resolveAfter2Seconds(20);
    let b = resolveAfter2Seconds(30);
    return x + await a + await b;
}

add1(10).then(v => {
    console.log(v); // 60 after 2 s
});

async function add2(x) {
    let a = await resolveAfter2Seconds(20);
    let b = await resolveAfter2Seconds(30);
    return x + a + b;
}

add2(100).then(v => {
    console.log(v); // 150 after 4 s
});

function multiply(a, b = 1) {
    return a * b;
}

console.log(`r1: ${multiply(5, 2)}
r2: ${multiply(5, 1)}
r3: ${multiply(5)}`);

let a = 'foo', b = 42, c = {}, d = {a, b, c}; // a, b, c must be defined before d

console.log(`a: ${a}
b: ${b}
c: ${JSON.stringify(c)}
d: ${JSON.stringify(d)}`);

let o = {p: 42, q: true};
let {p, q} = o;

console.log(`o: ${JSON.stringify(o)}
p: ${p}
q: ${q}`);

let arr = ["one", "two", "three"];
let [one, two, three] = arr; // same as o, p, q

// Object Spread

let {a1,b1, ...rest} = {a1: 10, b1: 20, c1: 30, d1: 40};
// a1 is 10, b1 is 20, rest is {c1: 30, d1: 40}

let obj1 = {foo: 'bar', x: 42};
let obj2 = {foo: 'baz', y: 13};

let clonedObj = { ...obj1 };
console.log(clonedObj); // { foo: "bar", x: 42 }

let mergedObj = { ...obj1, ...obj2 };
console.log(mergedObj); // { foo: "baz", x: 42, y: 13 }