const bluebird = require ("bluebird");
const fs = require('fs');
const currentPath = require('path');
const readFileP = bluebird.promisify(fs.readFile);
const writeFileP = bluebird.promisify(fs.writeFile);

async function getFileAsString(path) {
    if (!path) { throw `No path was provided`;}
    try{
        const data = await readFileP(currentPath.join(__dirname, path),'utf8');
        return data.toString();
    }catch(e){
        throw `Error in either path, readFileP, or toString(): \n ${e}`;
    }
}

async function getFileAsJSON(path) {
    if (!path) { throw `No path was provided`;}
    try{
        const obj = await readFileP(currentPath.join(__dirname, path),'utf8');
        return JSON.parse(obj.toString());
    }catch(e){
        throw `Error in either path, readFileP, or JSON.parse: \n ${e}`;
    }
}

async function saveStringToFile(path, text) {
    if (!path || !text) { throw `No path or text was provided`;}
    try{
        await writeFileP(currentPath.join(__dirname, path),text.toString(),'utf8');
        return true;
    }catch(e){
        throw `Error in either path, writeFileP, or toString(): \n ${e}`;
    }
}

async function saveJSONToFile(path, obj) {
    if (!path || !obj) { throw `No path or object was provided`;}
    try{
        await writeFileP(currentPath.join(__dirname, path), JSON.stringify(obj) );
        return true;
    }catch(e){
        throw `Error in either path, writeFileP, or toString(): \n ${e}`;
    }
}

module.exports = {
    getFileAsString,
    getFileAsJSON,
    saveStringToFile,
    saveJSONToFile
}