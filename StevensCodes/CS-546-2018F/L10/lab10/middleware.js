"use strict";
const data = require("./data").users;
const bcrypt = require("bcrypt");

function authentication(request, response, next) {
    const username = request.body.username;
    const password = request.body.password;
    let errors = [];
    if (!username) {
        errors.push("No username provided");
    }
    if (!password) {
        errors.push("No password provided");
    }
    if (errors.length > 0) {
        response.render("checker/login", {
            hasErrors: true,
            errors: errors
        });
        return;
    }
    //operate database
    const FoundUser = data.getPostByName(username);
    FoundUser.then(function (data) {
        if (data) {
            //name exist. Note that bcrypt takes a long time
            const isSame = bcrypt.compareSync(password, data.HashedPassword);
            if (isSame === true) {
                //password matched
                console.log("Password Matched.");
                response.cookie("AuthCookie", data);
                return next();
            } else {
                //password not matched
                errors.push("Password NOT Matched.");
                console.log("Password NOT Matched.");
                response.render("checker/login", {
                    hasErrors: true,
                    errors: errors
                });
                return;
            }
        } else {
            //name wrong
            errors.push("User NOT Matched.");
            console.log("User NOT Matched.");
            response.render("checker/login", {
                hasErrors: true,
                errors: errors
            });
            return;
        }
    });
}

function protectPrivate(request, response, next) {
    const Auth = request.cookies.AuthCookie;
    if (!Auth) {
        response.status(403).render("checker/needLogIn");
        console.log("protect once")
        return;
    }
    next();
}

let currentNumberOfRequests = 0;
function mid1(request, response, next) {
    currentNumberOfRequests++;
    console.log("--------------------------------------");
    console.log(
        "There have now been " + currentNumberOfRequests +
        " requests made to the website."
    );
    next();
}

let pathsAccessed = {};
function mid2(request, response, next) {
    if (!pathsAccessed[request.path]) { pathsAccessed[request.path] = 0 };

    pathsAccessed[request.path]++;

    console.log(
        "There have now been " + pathsAccessed[request.path] +
        " requests made to " + request.path
    );
    next();
}

module.exports = {
    authentication,
    protectPrivate,
    mid1,
    mid2
};