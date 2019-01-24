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

