"use strict";
const express = require('express');
const app = express(); // init app

const configRoutes = require('./routes');
const port = 3000; // Set Port

configRoutes(app);

app.listen(port, () => {
    console.log("We got routes on http://localhost:" + port);
});