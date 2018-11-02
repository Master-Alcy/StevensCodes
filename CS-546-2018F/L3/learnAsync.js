/*whatever returned, would be Promise.resolve() and
packed into a Promise object*/
async function testAsync() {
    return "hello async";
}

//const result = testAsync();
//console.log(result);

testAsync().then(v => {
    console.log(v);
});
//if no return value would be Promise.resolve(undefined)

function getSomething() {
    return "something";
}

async function testAsync2() {
    return Promise.resolve("hello again async");
}

async function test() {
    const v1 = await getSomething();
    const v2 = await testAsync2();
    console.log(v1,v2);
}

test();
/*if await gets a non-promise object, result would be that
if await gets a Promise, then it would block the rest of the code
this is way await must be inside async
it would wait Promise object being resolved, then get the 
value of resolve
*/

function takeLongTime() {
    return new Promise(resolve => {
        setTimeout(() => resolve("long_time_value"), 1000);
    });
}

takeLongTime().then(v => {
    console.log("got", v);
});

async function test2() {
    const v = await takeLongTime();
    console.log(v + " with await");
}

test2();

//functon running time is n + 200
function takeLongTime2(n) {
    return new Promise(resolve => {
        setTimeout(() => resolve(n + 200), n);
    });
}

function step1(n) {
    console.log(`step1 with ${n}`);
    return takeLongTime2(n);
}

function step2(n) {
    console.log(`step2 with ${n}`);
    return takeLongTime2(n);
}

function step3(n) {
    console.log(`step3 with ${n}`);
    return takeLongTime2(n);
}

//promise
function doIt() {
    console.time("doIt");
    const time1 = 300;
    step1(time1)
        .then(time2 => step2(time2))
        .then(time3 => step3(time3))
        .then(result => {
            console.log(`result is ${result}`);
            console.timeEnd("doIt");
        });
}

doIt();

async function doIt2() {
    console.time("doIt2");
    const time1 = 300;
    const time2 = await step1(time1);
    const time3 = await step2(time2);
    const result = await step3(time3);
    console.log(`result is ${result}`);
    console.timeEnd("doIt2");
}

doIt2();