const todoItems = require("./mongoCollection").toDo;
const uuidv1 = require("uuid/v1");

async function createTask(title, description) {
    if (!title | !description) {
        throw "Need a title and a description";
    }
    const todoCollection = await todoItems();
    let newTask = {
        _id: uuidv1(),
        title: title,
        description: description,
        completed: false,
        completedAt: null
    }
    const insertInfo = await todoCollection.insertOne(newTask);
    if (insertInfo.insertedCount === 0) { throw "Could not add Task"; }
    const newId = insertInfo.insertedId;
    const item = await this.getTask(newId);
    return item;
}

async function getAllTasks() {
    const todoCollection = await todoItems();
    const itemAll = await todoCollection.find({}).toArray();
    return itemAll;
}

async function getTask(id) {
    if (!id) { throw "Need an id"; }
    const todoCollection = await todoItems();
    const todoitemgo = await todoCollection.findOne({ _id: id });
    if (todoitemgo === null) { throw `No item with '${id}'`; }
    return todoitemgo;
}

async function completeTask(taskId) {
    if (!taskId) { throw "Need a taskId."; }
    const todoCollection = await todoItems();
    const updatedToDo = {
        $set: {
            completed: true,
            completedAt: new Date().toString()
        }
    };
    const updateInfo = await todoCollection.updateOne({ _id: taskId }, updatedToDo);
    if (updateInfo.modifiedCount === 0) {
        throw `Could not update Task '${taskId}'`;
    }
    return await this.getTask(taskId);
}

async function removeTask(id) {
    if (!id) throw "Need an id to remove.";
    const todoCollection = await todoItems();
    const deletionInfo = await todoCollection.removeOne({ _id: id });
    if (deletionInfo.deletedCount === 0) {
        throw `Could not delete Task '${id}'`;
    }
    return true;
}

module.exports = {
    createTask,
    getAllTasks,
    getTask,
    completeTask,
    removeTask
}