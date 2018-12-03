const express = require("express");
const router = express.Router();
const bcrypt = require("bcrypt");
const userData = require("../data").users;

// This is for sign up new user
router.post("/", async (req, res) => {
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

router.post("/:id", async (req, res) => {
    console.log("Finding the theif");
    try {
        const find = await userData.getUserBySessionId(req.params.id);
        console.log(find);
        if (find) {
            console.log("Caught the theif");
            res.json({isFind: true});
        }
        console.log("Welcome");
        res.json({isFind: false});
    } catch (e) {
        res.status(500).json({
            error: "At post /user/:id " + e
        });
    }
});



module.exports = router;