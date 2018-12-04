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

router.post("/update", async (req, res) => {
    const clientBook = req.body;
    if (!clientBook) {
        res.json({
            success: false,
            msg: "Server does not get the book!"
        });
        return;
    }
    try {
        const foundBook = await bookData.getBooksByISBN(clientBook.ISBN);
        if (!foundBook.success || !foundBook) {
            res.status(500).json({
                success: false,
                msg: "Wrong ISBN, book not found"
            });
            return;
        }
        // Book must exist on server now
        const author = clientBook.profile.author;
        const description = clientBook.profile.description;
        const tag = clientBook.profile.tag;
        const bookId = foundBook.data._id;
        // If any profile exist, update it
        if (author !== "" || description !== "" ||
            tag !== "") {
            // Note, the field unchanged is ""
            const newProfile = await bookData.updateBookProfileById(
                bookId, clientBook.profile);
            if (!newProfile.success) {
                res.status(500).json({
                    success: false,
                    msg: "Update Profile Failed."
                });
                return;
            }
        }
        // Continue update storage
        const storageInfo = await bookData.changeStorageById(bookId, clientBook.storage);
        const totalStorageInfo = await bookData.changeTotalStorageById(bookId, clientBook.totalStorage);
        console.log(storageInfo);
        console.log(totalStorageInfo);
        if (storageInfo.success && totalStorageInfo.success) {
            res.json({
                success: true,
                msg: "Update Both Storage Success."
            });
            return;
        }
        res.status(500).json({
            success: false,
            msg: "Update Storage Failed, but Update Profile Success."
        });
    } catch (e) {
        res.json({
            success: false,
            msg: "At post /book/update " + e
        });
    }
});

module.exports = router;