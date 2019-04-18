const fileData = require("./fileData");
const textMetrics = require("./textMetrics");
const fs = require('fs');
const currentPath = require('path');

async function checkFileExist(path) {
    console.log("Enter checkFile");
    try {
        //Note that the attempts to make fs.access being promisified failed.
        //All my attempts to directely return boolean inside fs.access also failed.
        return await fs.access(path, fs.F_OK, (err) => {
            if (!err) {
                console.log("File found!");
                return true;
            } else {
                console.log("File not found!");
                return false;
            }
        });

    } catch (err) {
        throw `Error in Promise of fs.access:\n${err}`;
    }
}

async function processChapters(chapter) {
    if (!chapter) { throw `No path of chapter was provided`; }
    try {
        chapter = chapter.replace(/.txt/, '');
        filePath = currentPath.join(__dirname, `${chapter}.result.json`);
        await checkFileExist(filePath)
            .then(data => {
                if (data) {
                    console.log(`${chapter}.result.json exist.`);
                    fileData.getFileAsJSON(`${chapter}.result.json`)
                        .then(data => {
                            console.log(data);
                        }).catch(e => {
                            console.log(e);
                        });
                } else {
                    console.log(`${chapter}.result.json don't exist.`);
                    fileData.getFileAsString(`${chapter}.txt`)
                        .then(data => {
                            let metrix = textMetrics.createMetrics(data);
                            console.log(metrix);
                            fileData.saveJSONToFile(`${chapter}.result.json`, metrix)
                                .then(data => {
                                    console.log(`saveJSONToFile success. The existance of ${chapter}.result.json is: ` + data);
                                }).catch(e => {
                                    console.log(e);
                                });
                            fileData.saveStringToFile(`${chapter}.result.txt`, JSON.stringify(metrix))
                                .then(data => {
                                    console.log(`saveStringToFile success. The existance of ${chapter}.result.txt is: ` + data);
                                }).catch(e => {
                                    console.log(e);
                                });
                        }).catch(e => {
                            console.log(e);
                        });
                }
            }).catch(e => {
                console.log(e);
            });
    } catch (e) {
        throw `Error in processChapters: \n ${e}`;
    }
}

console.log("Run each processChapters once.");

processChapters("chapter1.txt")
    .catch(e => { console.log(e); });

processChapters("chapter2.txt")
    .catch(e => { console.log(e); });

processChapters("chapter3.txt")
    .catch(e => { console.log(e); });