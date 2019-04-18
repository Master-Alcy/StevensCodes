"use strict";
const data = require("./dummy.json");

async function getById(id) {
    return new Promise((resolve, reject) => {
        if ( id < 1 || id > 1000) {
            throw "index out of range";
        }
        setTimeout(() => { // find people
            const currProj = data[id - 1];
            if (currProj) {
                resolve(currProj);
            } else {
                reject(new Error("Data not found"));
            }
        }, 3000); // 5s
    });
}

module.exports = {
    getById
}