// In all cases, we have a callback which may run sometime in the future. 
// This "sometime in the future" is what we refer to as asynchronous flow.

// Asynchronous execution is pushed out of the synchronous flow. That is, 
// the asynchronous code will never execute while the synchronous code stack is 
// executing. This is the meaning of JavaScript being single-threaded.

// More specifically, when the JS engine is idle -- not executing a stack of 
// (a)synchronous code -- it will poll for events that may have triggered 
// asynchronous callbacks (e.g. expired timeout, received network response) 
// and execute them one after another. This is regarded as Event Loop.


const bluebird = require ("bluebird");
const fs = bluebird.promisifyAll(require('fs'));
const currentPath = require('path');

async function getFileAsString(path) {
    if (!path || typeof path !== 'string') {
        throw "You muse provide a valid path!";
    }
    const filePath = currentPath.join(__dirname, path);
    return await fs.readFileSync(filePath,'utf8', (err,data) => {
        if (err) { throw `Error in reading file: ${err}`;}
        return data.toString();
    });
}

getFileAsString('./chapterP.txt')
.then ((data, err) => {
    if (err) { throw `Some error is caught ${err}`; }
    //console.log("log insid Promise success: \n" + data);
});

//---------------------------------------------------
const fsOld = require('fs');

fsOld.readFile(currentPath.join(__dirname, './chapterP.txt'), 
'utf8', (err,data) =>{
    if(err){throw err};
    //console.log(data.toString());
});

//---------------------------------------------------
function readFile(path) {
    return new Promise((resolve, reject) => {
        fsOld.readFile(path,'utf8', (err,data) => {
            if (err) {
                reject(err); 
                return;
            }
            resolve(data);
        });
    });
}

readFile(currentPath.join(__dirname, './chapterP.txt'))
.then (data => {
    //console.log(data);
}).catch(e => {
    console.log(e);
});

//---------------------------------------------------
const util = require ('util');
const readFileP = util.promisify(fsOld.readFile);

readFileP (currentPath.join(__dirname, './chapterP.txt'))
.then (data => {
    //console.log(data.toString());
}).catch(e => {
    console.log(e);
});

//---------------------------------------------------
function* a(v) {
    yield console.log(v + 1);   //stop and do this
    yield console.log(v + 2);
    console.log(v + 3);
}

const b = a(5);
//b.next();
//b.next();
// setInterval(_ => {
//     b.next();       //trigger with next()
// }, 2000);

//---------------------------------------------------
async function rf() {
    try{
    const data = await readFileP(currentPath.join(__dirname, './chapterP.txt'));
    console.log(data.toString());
    }catch(e){
        throw `This is my Error Handler: \n ${e}`;
    }
}
rf();

(async () => {
    try {
        const data = await readFileP(currentPath.join(__dirname, './chapterP.txt'));
        //console.log(data.toString());
    } catch (e) {
        console.log(e);
    }
})();
