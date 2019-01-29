"use strict";
const uuidv4 = require('uuid/v4');
const model = require('./models');
const taskModel = model.getModel('Task');

function isNumeric(n) {
    return !isNaN(parseFloat(n)) && isFinite(n);
}

async function getAllTasks(skip, take) {
    // validate input
    if (!skip)
        skip = 0;
    if (!take)
        take = 20;
    skip = parseInt(skip);
    take = parseInt(take);
    if (!isNumeric(skip) || !isNumeric(take))
        return {
            success: false,
            desc: `Input not numbers`
        };
    if (skip < 0 || take < 0 || take > 100)
        return {
            success: false,
            desc: `Input out of range`
        };

    // get the data
    let result = await taskModel.find({}).skip(skip).limit(take);
    
    // validate data
    if (result && result.length > 0)
        return {
            success: true,
            data: result
        };
    else
        return {
            success: false,
            desc: `can't find any task`
        };
}

module.exports = {
    getAllTasks
}