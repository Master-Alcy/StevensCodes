const express = require("express");
const router = express.Router();
const bcrypt = require("bcrypt");
const userData = require("../data").users;

// This is for sign up new user
router.post("/", async (req, res) => {
    const formData = req.body;
    
    console.log("We are at server/routes/users/post");
    console.log(req.params);
    console.log(req.body);
    //console.log(res);
    console.log(res.body);

    try {
        formData.hashedPassword = await bcrypt.hash(formData.hashedPassword, 10);
        console.log(formData); // Debuging
        const newPost = await userData.addUser(formData);
        return res.json(newPost);
    } catch (e) {
        res.status(500).json({
            error: "At post /user " + e
        });
    }
});



module.exports = router;