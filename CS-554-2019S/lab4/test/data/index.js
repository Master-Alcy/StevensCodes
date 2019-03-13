"use strict";
const data = require("./dummy.json");

async function getById(id) {
    return new Promise((resolve, reject) => {
        setTimeout(() => { // find project
            const currProj = data[id - 1];
            if (currProj) {
                resolve(currProj);
            } else {
                reject(new Error("Data not found"));
            }
        }, 5000);
    });
}

module.exports = {
    getById
}