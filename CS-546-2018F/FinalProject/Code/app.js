"use strict";
const connect = require('./data/models');
const data = require('./data');
const books = data.books;
const users = data.users;

const main = async()=>{
    let book = await books.getRecordByRecordId('');
    console.log(book);
};

main();