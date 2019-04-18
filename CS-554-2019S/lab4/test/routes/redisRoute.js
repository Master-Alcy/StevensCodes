"use strict";
const express = require("express");
const router = express.Router();

const redis = require('redis');
const bluebird = require("bluebird");
bluebird.promisifyAll(redis);
const client = redis.createClient(); // localhost:6379

const data = require('../data');
const LRU = "myList";
const HASH = "myHash"

async function keepLast20(id) {
    const queueLength = await client.llenAsync(LRU); // get length
    if (queueLength === 20) { // should never be 21
        await client.rpopAsync(LRU); // queue is 20, reduce to 19
    }
    return await client.lpushAsync(LRU, id); // add and becomes 20
}

router.get("/history", async (request, response) => {
    try {
        let resultArray = [];
        const redisList = await client.lrangeAsync(LRU, 0, -1); // get full list of keys

        for (let i = 0; i < redisList.length; i++) {
            const entry = await client.hgetAsync(HASH, redisList[i]); // get data in redis
            resultArray.push(JSON.parse(entry));
        }
        return response.status(200).json(resultArray);
    } catch (e) {
        return response.status(500).json({ error: "In get /history " + e });
    }
});

function isNumeric(n) {
    return !isNaN(parseFloat(n)) && isFinite(n);
}

router.get("/:id", async (request, response) => {
    const id = parseInt(request.params.id); // should be number
    if (!isNumeric(id)) {
        return response.status(400).json({ error: "id not valid" });
    }
    try {
        const redisExist = await client.hexistsAsync(HASH, id); // check existence

        if (redisExist === 1) {
            await keepLast20(id); // renew queue
            const redisData = await client.hgetAsync(HASH, id); // get from cache
            return response.status(200).json(JSON.parse(redisData));
        } else { // id don't exist
            const resultDisk = await data.getById(id); // error goes to catch, slow read disk
            await keepLast20(id); // renew queue
            await client.hsetAsync(HASH, id, JSON.stringify(resultDisk)); // save in redis
            return response.status(200).json(resultDisk);
        }
    } catch (e) {
        return response.status(500).json({ error: "In get /:id " + e });
    }
});

module.exports = router;