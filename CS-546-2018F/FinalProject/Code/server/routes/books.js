"use strict";
const express = require("express");
const router = express.Router();
const bookData = require("../data").books;
const userData = require("../data").users;

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

router.post("/changeRecord", async (req, res) => {
    // Need to add to both student record and book record
    const clientRequest = req.body;
    let action = (clientRequest.action === "ren") ? "rent out" : "receive";
    const date = clientRequest.time;
    try {
        const student = await userData.getUserByUsername(clientRequest.studentName);
        const staff = await userData.getUserByUsername(clientRequest.staffName);
        const book = await bookData.getBooksByISBN(clientRequest.ISBN);
        if (!student.success || !staff.success || !book.success ||
            clientRequest.action === "" || !date) {
            res.json({
                success: false,
                msg: "Server does not get all valid information!"
            });
            return;
        }
        if (student.data.identity !== "student" || staff.data.identity !== "staff") {
            res.json({
                success: false,
                msg: "Identity Invalid!"
            });
            return;
        }

        const bookRecordData = {
            studentid: student.data._id,
            staffid: staff.data._id,
            time: date,
            action: action
        }

        action = (action === "rent out") ? "borrow" : "return";
        const studentRecordData = {
            bookid: student.data._id,
            staffid: staff.data._id,
            time: date,
            action: action
        }

        const newBookRecord = await bookData.addRecordById(book.data._id, bookRecordData);
        const newStudentRecord = await userData.addRecordById(student.data._id, studentRecordData);

        if (newBookRecord.success && newStudentRecord.success) {
            res.json({
                success: true,
                msg: "Both records update successfully."
            });
            return;
        }
        res.json({
            success: false,
            msg: "Records update failed."
        });
    } catch (e) {
        res.status(500).json({
            success: false,
            msg: "At post /book/add " + e
        });
    }
});

router.post("/search", async (req, res) => {
    // Note this is for search by title
    const title = req.body.title;
    if (!title || title === "") {
        res.json({
            success: false,
            msg: "Invalid title"
        });
        return;
    }
    try {
        const foundBook = await bookData.getBookIdByTitle(title);
        if (foundBook.success) {
            res.json({
                success: true,
                data: foundBook.data
            });
        } else {
            res.json({
                success: false,
                msg: "Book not found!"
            });
        }
    } catch (e) {
        res.status(500).json({
            msg: "At post /user/login " + e
        });
    }
});

router.post("/search/ISBN", async (req, res) => {
    const ISBN = req.body.ISBN;
    if (!ISBN || ISBN === "") {
        res.json({
            success: false,
            msg: "Invalid ISBN"
        });
        return;
    }
    try {
        const foundBook = await bookData.getBooksByISBN(ISBN);
        if (foundBook.success) {
            res.json({
                success: true,
                data: foundBook.data
            });
        } else {
            res.json({
                success: false,
                msg: "Book not found!"
            });
        }
    } catch (e) {
        res.status(500).json({
            msg: "At post /user/login " + e
        });
    }
});

router.post("/search/key", async (req, res) => {
    const key = req.body.key;
    if (!key || key === "") {
        res.json({
            success: false,
            msg: "Invalid ISBN"
        });
        return;
    }
    try {
        const foundBook = await bookData.fuzzySearch(key);
        if (foundBook.success) {
            res.json({
                success: true,
                data: foundBook.data
            });
        } else {
            res.json({
                success: false,
                msg: "Book not found!"
            });
        }
    } catch (e) {
        res.status(500).json({
            msg: "At post /user/login " + e
        });
    }
});

module.exports = router;