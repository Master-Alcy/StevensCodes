"use strict";
const express = require("express");
const router = express.Router();
const bookData = require("../data").books;

router.post("/add", async (req, res) => {
    console.log("Trying to /book/add");
    const clientBook = req.body;

    console.log(clientBook);

    if (!clientBook) {
        res.json({
            success: false,
            msg: "Server does not get the book!"
        });
    }
    try {
        const newBook = await bookData.addBook(clientBook);

        console.log(newBook);

        // Add successed.
        if (newBook.success) {
            res.json({
                success: true,
                msg: "Adding success"
            });
        }
        res.json({
            success: false,
            msg: "Adding failed"
        });
    } catch (e) {
        res.status(500).json({
            success: false,
            error: "At post /book/add " + e
        });
    }
});

module.exports = router;