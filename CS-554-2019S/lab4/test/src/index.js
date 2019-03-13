"use strict";
const bluebird = require("bluebird");
const express = require('express');
const redis = require('redis');

const app = express(); // init app
const client = redis.createClient(); // localhost:6379
const port = 3000; // Set Port

bluebird.promisifyAll(redis.RedisClient.prototype);
bluebird.promisifyAll(redis.Multi.prototype);


console.time("stopwatch");

client.on('error', (err) => {
    console.log('Something went wrong ', err);
});

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