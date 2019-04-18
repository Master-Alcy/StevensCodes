/*where to use asynchronous code
working with files, running web server, 
making HTTP request, database operations
*/
/* 1. We will use prompt to ask the user for the name of a file to open
2. Once that is complete, we will read the file
3. Once that is complete, we will reverse the content of the file
4. Once that is complete, we will save the file again.
-------------------CHECK callbacks folder online---------------------
Problems:
1. Code becomes unreadable.
2. Handling errors becomes confusing.
*/
/* A promise is an object that represents the eventual result
of some asynchronous operation
Asynchronous method:
1.Immediately return a new Promise object, 
which takes a callback to run on success and failure
2. Prepare the asynchronous call
3. Run the asynchronous component of the method; 
due to how JavaScript’s event queue works, 
this will always begin to run after the current method ends.
4. Return a promise that will resolve the request after 
the asynchronous operation is completed
*/
/* Promises have a 'then' functon that takes
1 to 2 parameters: one necessary callback for successful case,
and one for handing errors. 'then' returns another promise,
which will return the result from the callback from the first
promise. Use this to chain asynchronous operations. 
*/
//*----------------------------------
let readResult = readFileAndReturnPromiseWithContent ("data.txt");

readResult.then ( (fileContent) => {
    //return string split into an array
    return fileContent.split("\n");
}).then ( (paragraphArray) => {
    let newFileText = JSON.stringify(paragraphArray);
    return writeFileAndReturnPromise (newFileText);
}, (readFileError) => {
    console.log ("Error splitting text or reading file; returning an empty array");
    return [];
}).then (()=>{
    console.log("Everything has worked!");
}, (error) =>{
    console.log("An error has occurred!");
    console.log(error);
})
//------------------------------------*/
/*.then(null, (errorHandler) => {})
bluebird to convert methods from taking
callbacks to promises
promisify and promisifyAll
*/
//*-------------------------------------------
const bluebird = require("bluebird");
const Promise = bluebird.Promise;

const prompt = bluebird.promisifyAll(require("prompt"));
const fs = bluebird.promisifyAll(require("fs"));

const getFileOperation = {
    name : "fileName",
    description: "What file do you want to open?"
};

prompt
    .getAsync([getFileOperation])
    .then(function(result){
    })
//*/---------------------------------------
//-------------------CHECK promise folder online---------------------
//  async/await ==> async functions and await
/*A function can be defined as an asyncfunction, 
which means that the function will automatically return a promise 
(even if there are no asynchronous operation in that function).
mark function as async allows await keyword
async function vs function:
await for promises, and returnning promises.
await would cause the rest of the function to execute
after that promise resolves or rejects.
result of await is undefined or a value.
*/
//*-------------------------------------------
prompt
    .getAsync([getFileOperation])
    .then(function(result) {
        const fileNmae = result.fileName;
        if (!fileNmae){
            throw "Need to provide a file name";
        }
        console.log(`About to read ${fileName} if it exists`);
        return fileName;
    }).then (function(fileName){
        return fs.readFileAsync(fileName, "utf-8")
        .then(function(data){
            return {fileName: fileName, fileContent: data};
        });
    })
//^^^ use promises
async function main(){
    const getFileOperation = {
    };
    //gets result of user input
    const promptResult = await prompt.getAsync([getFileOperation]);
    const fileName = promptResult.fileName;
    if (!fileName) {
        throw "Need to provide a file name";
    }
    console.log(`About to read ${fileName} if it exists`);
    const fileContent = await fs.readFileAsync(fileName, "utf-8");
}
//^^^ use async/await
//*/---------------------------------------
//-------------------CHECK async-await folder online---------------------
/*1. use bluebird to promisify the entirety of fs and prompt
2. use promises
*/