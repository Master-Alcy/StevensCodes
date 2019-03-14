"use strict";
const express = require("express");
const router = express.Router();

const redis = require('redis');
const bluebird = require("bluebird");
bluebird.promisifyAll(redis);
const client = redis.createClient(); // localhost:6379

const data = require('../data');

async function keepLast20(id) {
    const queueLength = await client.llenAsync("last20"); // get length
    if (queueLength === 20) { // should never be 21
        await client.rpopAsync('last20'); // queue is 20, reduce to 19
    }
    return await client.lpushAsync("last20", id); // add and becomes 20
}

router.get("/history", async (request, response) => {
    try {
        let resultArray = [];
        const redisList = await client.lrangeAsync("last20", 0, -1); // get full list of keys

        for (let i = 0; i < redisList.length; i++) {
            const entry = await client.getAsync(redisList[i]); // get data in redis
            // resultArray.push(unflatten(JSON.parse(entry)));
            resultArray.push(JSON.parse(entry));
        }

        return response.status(200).json(resultArray);
    } catch (e) {
        return response.status(500).json({ error: e });
    }
});

router.get("/:id", async (request, response) => {
    const id = parseInt(request.params.id); // should be number
    if (isNaN(id) || !isFinite(id)) {
        return response.status(400).json({ error: "id not valid" });
    }

    try {
        const redisExist = await client.existsAsync(id); // check existence

        if (redisExist === 1) {
            // console.log("In cache");
            await keepLast20(id); // renew queue
            const redisData = await client.getAsync(id); // get from cache
            // console.log(redisData);
            return response.status(200).json(JSON.parse(redisData));
        } else { // id don't exist
            // console.log("In disk");
            const resultDisk = await data.getById(id); // error goes to catch, slow read disk
            await keepLast20(id); // renew queue
            // console.log(flatten(resultDisk));
            await client.setAsync(id, JSON.stringify(resultDisk)); // save in redis
            return response.status(200).json(resultDisk);
        }
    } catch (e) {
        return response.status(500).json({ error: "In get /:id " + e });
    }
});

module.exports = router;