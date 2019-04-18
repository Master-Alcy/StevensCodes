const express = require("express");
const router = express.Router();
const data = require("../data");

router.get("/about", async (req, res) => {
    try {
        const aboutG = await data.about;
        res.json(aboutG);
    } catch (e) {
        res.status(404).json({message: "Not found at /about"});
    }
});

router.get("/story", async (req, res) => {
    try {
        const storyG = await data.story;
        res.json(storyG);
    } catch (e) {
        res.status(404).json({message: "Not found at /story"});
    }
});

router.get("/education", async (req, res) => {
    try {
        const educationG = await data.education;
        res.json(educationG);
    } catch (e) {
        res.status(404).json({message: "Not found at /education"});
    }
});

module.exports = router;