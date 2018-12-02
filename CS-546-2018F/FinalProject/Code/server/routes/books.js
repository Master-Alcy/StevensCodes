const express = require("express");
const router = express.Router();
const bookData = require("../data").books;

(async () => {
    let book = await bookData.getRecordByRecordId('');
    console.log(book);
})();



module.exports = router;