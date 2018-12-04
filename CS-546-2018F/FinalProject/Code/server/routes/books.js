"use strict";
const express = require("express");
const router = express.Router();
const bookData = require("../data").books;

router.post("/add", async (req, res) => {
    const clientBook = req.body;
    if (!clientBook) {
        res.json({
            success: false,
            msg: "Server does not get the book!"
        });
        return;
    }
    try {
        const newBook = await bookData.addBook(clientBook);
        // Add successed.
        if (newBook.success) {
            res.json({
                success: true,
                msg: "Adding success"
            });
            return;
        }
        res.json({
            success: false,
            msg: newBook.desc
        });
    } catch (e) {
        res.json({
            success: false,
            msg: "At post /book/add " + e
        });
    }
});

module.exports = router;