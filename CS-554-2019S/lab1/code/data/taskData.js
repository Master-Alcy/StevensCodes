"use strict";
const uuidv4 = require('uuid/v4');
const model = require('./models');
const taskModel = model.getModel('Task');

function isNumeric(n) {
    return !isNaN(parseFloat(n)) && isFinite(n);
}

async function getAllTasks(skip, take) {
    // set default value if no params
    if (!skip) skip = 0;
    if (!take) take = 20;
    // parse string to integer
    skip = parseInt(skip);
    take = parseInt(take);
    // validate inputs
    if (!isNumeric(skip) || !isNumeric(take))
        return {success: false, desc: `Input not numbers`};
    // validate range

    if (skip < 0 || take < 0 || take > 100)
        return {success: false, desc: `Input out of range`};
    // console.log(`skip is: ${skip}, take is: ${take}`);
    // get data
    const result = await taskModel.find({}).skip(skip).limit(take);
    // validate data
    if (result && result.length > 0)
        return {success: true, data: result};
    else
        return {success: false, desc: `can't find any task`};
}

async function getTaskById(taskId) {
    // Validate input
    if (typeof taskId !== 'string')
        return {success: false, desc: `Invalid taskId.`};
    // get data
    const result = await taskModel.findOne({id: taskId});
    // validate data
    if (result)
        return {success: true, data: result};
    else
        return {success: false, desc: `can't find ${taskId} in database.`};
}

async function addTask(title, description, hoursEstimated, completed) {
    // Validate input
    if (typeof title !== 'string' || typeof description !== 'string' 
        || !isNumeric(hoursEstimated) || typeof completed !== 'boolean')
        return {success: false, desc: `Invalid params.`};
    // post data
    const newTask = await new taskModel({
        id: uuidv4(),
        title: title,
        description: description,
        hoursEstimated: hoursEstimated,
        completed: completed,
        comments: []
    });

    try {
        await newTask.save();
        return {success: true, data: newTask};
    } catch (e) {
        return {success: false, desc: e};
    }
}

async function updateWholeTaskById(taskId, title, description, hoursEstimated, completed) {
    // Validate input
    if (typeof taskId !== 'string' || typeof title !== 'string' || typeof description !== 'string' 
        || !isNumeric(hoursEstimated) || typeof completed !== 'boolean')
        return {success: false, desc: `Invalid params.`};
    // put data
    const result = await taskModel.findOneAndUpdate(
        {id: taskId},
        {$set: {
            title: title,
            description: description,
            hoursEstimated: hoursEstimated,
            completed: completed
        }},
        {new: true} // return updated object
    ); // Note, updateOne is fine. But returned with {n, nModified, ...}
    // validate data
    if (result)
        return {success: true, data: result};
    else
        return {success: false, desc: `can't find ${taskId} in database.`};
}

async function updatePartialTaskById(taskId, tobeUpdated) {
    // get data to be updated
    const dataTobeUpdated = {};
    if (tobeUpdated.title)
        if (typeof title !== 'string')
        updatedPostData.title = tobeUpdated.title;
    if (tobeUpdated.description)
        updatedPostData.description = tobeUpdated.description;
    if (tobeUpdated.hoursEstimated)
        updatedPostData.hoursEstimated = tobeUpdated.hoursEstimated;
    if (tobeUpdated.completed)
        updatedPostData.completed = tobeUpdated.completed;




    // Validate input
    if (typeof taskId !== 'string' || typeof title !== 'string' || typeof description !== 'string' 
        || !isNumeric(hoursEstimated) || typeof completed !== 'boolean')
        return {success: false, desc: `Invalid params.`};
    // put data

    const result = await taskModel.findOneAndUpdate(
        {id: taskId},
        {$set: {
            title: title,
            description: description,
            hoursEstimated: hoursEstimated,
            completed: completed
        }},
        {new: true} // return updated object
    ); // Note, updateOne is fine. But returned with {n, nModified, ...}
    // validate data
    if (result)
        return {success: true, data: result};
    else
        return {success: false, desc: `can't find ${taskId} in database.`};
}

module.exports = {
    getAllTasks,
    getTaskById,
    addTask,
    updateWholeTaskById,
    updatePartialTaskById
}