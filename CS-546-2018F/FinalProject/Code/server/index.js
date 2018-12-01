"use strict";
const express = require('express');
const PORT = process.env.PORT || 3000;
const bodyParser = require('body-parser');
const path = require('path');
const app = express();

const connect = require('./data/models');
const data = require('./data');
const books = data.books;
const users = data.users;

const test = async()=>{
  let book = await books.getRecordByRecordId('');
  console.log(book);
};
test();

app.use(bodyParser.json());
app.use(express.static(`${__dirname}/../client/dist`));

app.get('*', (req, res) => {
  res.sendFile(path.resolve(`${__dirname}/../client/dist/index.html`));
});

app.listen(PORT, () => {
  console.log(`listening on port ${PORT}!`);
});