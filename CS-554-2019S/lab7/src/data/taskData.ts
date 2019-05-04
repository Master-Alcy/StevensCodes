"use strict";
import uuidv4 from "uuid/v4";
const model = require("./models");
const taskModel = model.getModel("Task");

function isNumeric(n: any) {
    return !isNaN(parseFloat(n)) && isFinite(n);
}

async function getAllTasks(skip: any, take: any) {
    // set default value if no params
    if (typeof skip === "undefined") { skip = 0; }
    if (typeof take === "undefined") { take = 20; }
    // parse string to integer
    skip = parseInt(skip);
    take = parseInt(take);
    // validate inputs
    if (!isNumeric(skip) || !isNumeric(take) || skip < 0 || take <= 0 || take > 100) {
        return {success: false, desc: `Input not valid numbers`};
    }
    // console.log(`skip is: ${skip}, take is: ${take}`);
    // get data, get rid of _id and __v
    const result = await taskModel.find({}, "-_id -__v").skip(skip).limit(take);
    // validate data
    if (result && result.length > 0) {
        return {success: true, data: result};
    }
    else {
        return {success: false, desc: `can't find any task`};
    }
}

async function getTaskById(taskId: string) {
    // Validate input
    if (typeof taskId !== "string") {
        return {success: false, desc: `Invalid taskId.`};
    }
    // get data, get rid of _id and __v
    const result = await taskModel.findOne({id: taskId}, "-_id -__v");
    // validate data
    if (result) {
        return {success: true, data: result};
    }
    else {
        return {success: false, desc: `can't find ${taskId} in database.`};
    }
}

function transObject(obj: any) { // anyway to improve?
    const {id, title, description, hoursEstimated, completed, comments} = obj;
    return {id, title, description, hoursEstimated, completed, comments};
}

async function addTask(title: string, description: string, hoursEstimated: any, completed: boolean, comments: any) {
    // Validate input
    if (typeof title !== "string" || typeof description !== "string"
        || !isNumeric(hoursEstimated) || typeof completed !== "boolean") {
        return {success: false, desc: `Invalid params.`};
    }
    if (Array.isArray(comments)) {
        // validate comments array
        for (let i = 0; i < comments.length; i++) {
            if (typeof comments[i].name !== "string" || typeof comments[i].comment !== "string") {
                return {success: false, desc: `comments has invalid entry`};
            }
            comments[i].id = uuidv4();
        }
    } else {
        comments = [];
    }
    // post data
    const newTask = await new taskModel({
        id: uuidv4(),
        title,
        description,
        hoursEstimated,
        completed,
        comments
    });
    // save newTask
    try {
        await newTask.save();
        // a stupid way of avoid _id and __v
        return {success: true, data: transObject(newTask)};
    } catch (e) {
        return {success: false, desc: e};
    }
}

async function updateWholeTaskById(taskId: string, title: string, description: string, hoursEstimated: any, completed: boolean) {
    // Validate input
    if (typeof taskId !== "string" || typeof title !== "string" || typeof description !== "string"
        || !isNumeric(hoursEstimated) || hoursEstimated < 0 || typeof completed !== "boolean") {
        return {success: false, desc: `Invalid params.`};
    }
    // put data
    const result = await taskModel.findOneAndUpdate(
        {id: taskId},
        {$set: {
            title,
            description,
            hoursEstimated,
            completed
        }},
        {new: true, projection: {_id: 0, __v: 0}} // return updated object, and not returning _id and __v
    ); // Note, updateOne is fine. But returned with {n, nModified, ...}
    // validate data
    if (result) {
        return {success: true, data: result};
    }
    else {
        return {success: false, desc: `can't find ${taskId} in database.`};
    }
}

async function updatePartialTaskById(taskId: string, tobeUpdated: any) {
    // get data to be updated
    const errorlist = [];
    if (typeof taskId !== "string") {
        errorlist.push(`taskId not valid.`);
    }
    // check if tobeUpdated is empty, this is for ECMA 5+
    if (Object.keys(tobeUpdated).length === 0 && tobeUpdated.constructor === Object) {
        errorlist.push(`no input provided.`);
    }
    // populate dataTobeUpdated, seems stupid, imporve?
    const dataTobeUpdated: {[k: string]: any} = {};
    if (typeof tobeUpdated.title !== "undefined") {
        if (typeof tobeUpdated.title !== "string") {
            errorlist.push(`title not valid.`);
        }
        dataTobeUpdated.title = tobeUpdated.title;
    }
    if (typeof tobeUpdated.description !== "undefined") {
        if (typeof tobeUpdated.description !== "string") {
            errorlist.push(`description not valid.`);
        }
        dataTobeUpdated.description = tobeUpdated.description;
    }
    if (typeof tobeUpdated.hoursEstimated !== "undefined") {
        if (!isNumeric(tobeUpdated.hoursEstimated) || tobeUpdated.hoursEstimated < 0) {
            errorlist.push(`hoursEstimated not a valid number.`);
        }
        dataTobeUpdated.hoursEstimated = tobeUpdated.hoursEstimated;
    }
    if (typeof tobeUpdated.completed !== "undefined") {
        if (typeof tobeUpdated.completed !== "boolean") {
            errorlist.push(`completed not valid.`);
        }
        dataTobeUpdated.completed = tobeUpdated.completed;
    }
    // check if dataTobeUpdated is empty, this is for ECMA 5+
    if (Object.keys(dataTobeUpdated).length === 0 && dataTobeUpdated.constructor === Object) {
        errorlist.push(`nothing valid provided.`);
    }
    if (errorlist.length !== 0) {
        return {success: false, desc: errorlist};
    }
    // put data
    const result = await taskModel.findOneAndUpdate(
        {id: taskId},
        {$set: dataTobeUpdated},
        {new: true, projection: {_id: 0, __v: 0}} // return updated object, and not returning _id and __v
    );
    // validate data
    if (result) {
        return {success: true, data: result};
    }
    else {
        return {success: false, desc: `can't find ${taskId} in database.`};
    }
}

async function addComment(taskId: string, name: string, comment: string) {
    // Validate input
    if (typeof taskId !== "string" || typeof name !== "string" || typeof comment !== "string") {
        return {success: false, desc: `Invalid params.`};
    }
    // put data
    const result = await taskModel.findOneAndUpdate(
        {id: taskId},
        {$push: {
            comments: {
                id: uuidv4(),
                name,
                comment
            }
        }},
        {new: true, projection: {_id: 0, __v: 0}} // return updated object, and not returning _id and __v
    );
    // validate data
    if (result) {
        return {success: true, data: result};
    }
    else {
        return {success: false, desc: `can't find ${taskId} in database.`};
    }
}

async function deleteComment(taskId: string, commentId: string) {
    // Validate input
    if (typeof taskId !== "string" || typeof commentId !== "string") {
        return {success: false, desc: `Invalid params.`};
    }
    // put data
    const result = await taskModel.findOneAndUpdate(
            {id: taskId},
            {$pull: {comments: {id: commentId}}},
            {new: true, projection: {_id: 0, __v: 0}} // return updated object, and not returning _id and __v
    );
    // validate data
    if (result) {
        return {success: true, data: result};
    }
    else {
        return {success: false, desc: `can't find ${taskId} with ${commentId} in database.`};
    }
}

module.exports = {
    getAllTasks,
    getTaskById,
    addTask,
    updateWholeTaskById,
    updatePartialTaskById,
    addComment,
    deleteComment
};
