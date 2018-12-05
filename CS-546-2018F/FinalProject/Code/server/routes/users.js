"use strict";
const express = require("express");
const router = express.Router();
const bcrypt = require("bcrypt");
const userData = require("../data").users;

// This is for sign up new user
router.post("/signup", async (req, res) => {
    const formData = req.body;
    try {
        formData.hashedPassword = await bcrypt.hash(formData.hashedPassword, 10);
        const newPost = await userData.addUser(formData);
        const clientRes = {
            success: newPost.success,
            sessionId: newPost.data.sessionId,
            identity: newPost.data.identity
        };
        res.json(clientRes);
    } catch (e) {
        res.status(500).json({
            error: "At post /user " + e
        });
    }
});

// Finding existing user
router.post("/login", async (req, res) => {
    console.log("Trying to /user/login");
    const username = req.body.username;
    const password = req.body.hashedPassword;
    // username and password must be valid, checked in LoginPage.jsx
    try {
        const foundUser = await userData.getUserByUsername(username);
        if (foundUser.success) { // Found name in database
            const serverHashedPassword = foundUser.data.hashedPassword;
            const match = await bcrypt.compare(password, serverHashedPassword);
            if (match) { // Password match
                res.json({
                    isFind: true,
                    msg: "Welcome back " + username,
                    sessionId: foundUser.data.sessionId,
                    identity: foundUser.data.identity
                });
            } else { // Errr password not match
                res.json({
                    isFind: false,
                    msg: "Password is not matched!"
                });
            }
        } else { // Username not found in database
            res.json({
                isFind: false,
                msg: "Username is not found!"
            });
        }
    } catch (e) {
        res.status(500).json({
            error: "At post /user/login " + e
        });
    }
});

// This is to check authentication
// Note that /:id may confuse the function
// Should be placed as last post method
router.post("/:id", async (req, res) => {
    try {
        const find = await userData.getUserBySessionId(req.params.id);
        console.log(find);
        if (find) {
            console.log("Welcome dude");
            res.json({
                isFind: true
            });
        } else {
            console.log("Not found");
            res.json({
                isFind: false
            });
        }
    } catch (e) {
        res.status(500).json({
            error: "At post /user/:id " + e
        });
    }
});

module.exports = router;