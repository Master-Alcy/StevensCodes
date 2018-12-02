"use strict";
const express = require('express');
const PORT = process.env.PORT || 3000;
const bodyParser = require('body-parser');
const path = require('path');

const app = express();
const configRouters = require("./routes");

app.use(bodyParser.json());
app.use(express.static(`${__dirname}/../client/dist`));

configRouters(app);

app.listen(PORT, () => {
  console.log(`listening on port ${PORT}!`);
});