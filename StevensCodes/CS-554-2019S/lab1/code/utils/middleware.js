"use strict";
// The first will log all request bodies, as well as the url path 
// they are requesting, and the HTTP verb they are using to make the request
function mid1(request, response, next) {
    const currentBody = JSON.stringify(request.body);
    const currentPath = request.protocol + '://' + request.get('host') + request.originalUrl;
    const currentHTTP = request.method;

    console.log(`===================per Request====================
HTTP header: ${currentHTTP}, for URL: ${currentPath},
with body: ${currentBody}`);

    next();
}

// The second will keep track of many times a particular URL has been requested, 
// updating and logging with each request.
let currentNumberOfRequests = 0,
    pathsAccessed = {};

function mid2(request, response, next) {
    const currentPath = request.protocol + '://' + request.get('host') + request.originalUrl;;

    if (!pathsAccessed[currentPath])
        pathsAccessed[currentPath] = 0

    pathsAccessed[currentPath]++;
    currentNumberOfRequests++;

    console.log(`
There have now been ${currentNumberOfRequests} requests made to the website.
Where ${pathsAccessed[currentPath]} requests were made to ${currentPath}`);

    console.log(`------------------list of paths-------------------`);

    for (let aPath in pathsAccessed) {
        console.log(`Accessed ${aPath} for ${pathsAccessed[aPath]} times.`);
    }

    next();
}

module.exports = {
    mid1,
    mid2
};