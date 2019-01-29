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
    if (typeof taskId !== 'string')
        return {success: false, desc: `taskId not valid.`};
    if (!tobeUpdated)
        return {success: false, desc: `no input provided.`};
    // populate dataTobeUpdated
    const dataTobeUpdated = {};
    if (tobeUpdated.title) {
        if (typeof tobeUpdated.title !== 'string')
            return {success: false, desc: `title not valid.`};
        dataTobeUpdated.title = tobeUpdated.title;
    }
    if (tobeUpdated.description) {
        if (typeof tobeUpdated.description !== 'string')
            return {success: false, desc: `description not valid.`};
        dataTobeUpdated.description = tobeUpdated.description;
    }
    if (tobeUpdated.hoursEstimated) {
        if (!isNumeric(tobeUpdated.hoursEstimated))
            return {success: false, desc: `hoursEstimated not a valid number.`};
        dataTobeUpdated.hoursEstimated = tobeUpdated.hoursEstimated;
    }
    if (tobeUpdated.completed) {
        if (typeof tobeUpdated.completed !== 'boolean')
            return {success: false, desc: `completed not valid.`};
        dataTobeUpdated.completed = tobeUpdated.completed;
    }
    // put data
    const result = await taskModel.findOneAndUpdate(
        {id: taskId},
        {$set: dataTobeUpdated},
        {new: true} // return updated object
    );
    // validate data
    if (result)
        return {success: true, data: result};
    else
        return {success: false, desc: `can't find ${taskId} in database.`};
}

async function addComment(taskId, name, comment) {
    // Validate input
    if (typeof name !== 'string' || typeof comment !== 'string')
        return {success: false, desc: `Invalid params.`};
    // put data
    const result = await taskModel.findOneAndUpdate(
        {id: taskId},
        {$push: {
            comments: {
                id: uuidv4(),
                name: name,
                comment: comment
            }
        }},
        {new: true} // return updated object
    );
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
    updatePartialTaskById,
    addComment
}