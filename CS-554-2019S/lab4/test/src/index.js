"use strict";
const express = require('express');
const exphbs = require('express-handlebars');
const path = require('path');
const bodyParser = require('body-parser');
const methodOverride = require('method-override');
const redis = require('redis');
// Set Port
const port = 3000;
// init app
const app = express();
// view enginer
app.engine('handlebars', exphbs({defaultLayout: 'main'}));
app.set('view engine', 'handlebars');
// localhost:6379
const client = redis.createClient();

const aQuery = "";
console.time("stopwatch");

// client.on('error', (err) => {
//     console.log('Something went wrong ', err);
// });

// client.set('redis test', 'my test value', redis.print);

client.get(aQuery, (error, result) => {
    if (error) throw error;
    if (result) {
        console.timeEnd("stopwatch");
        console.log('GET result ->', result, ", len: ", result.length);
    } else {      
        client.expire(aQuery, 20);
    }
});