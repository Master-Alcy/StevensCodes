const express = require("express");
const router = express.Router();
const isRev = require("../public/testText").test;

router.get("/", async (req, res) => {
    try {
        res.render("posts/new", { layout: 'main.handlebars' });
    } catch (e) {
        res.status(500).json({ error: "At get /. " + e });
    }
});

router.get("/result", async (req, res) => {
    try {
        res.render("posts/result", { layout: 'mainRes.handlebars' });
    } catch (e) {
        res.status(500).json({ error: "At get /result. " + e });
    }
});

router.post("/result", async (req, res) => {
    const blogPostData = req.body;
    try {
        const palindrome = blogPostData["text-to-test"];   
        
        //isRev() would throw if no argument provided
        if (isRev(palindrome)) {
            res.render("posts/result", { layout: 'mainRes.handlebars', 
            isRev: true, theBody: palindrome });
        } else {
            res.render("posts/result", { layout: 'mainRes.handlebars', 
            theBody: palindrome });
        }
    } catch (e) {
        res.status(400).render("posts/error", { 
            layout: 'mainRes.handlebars', err: e});
    }
});

module.exports = router;