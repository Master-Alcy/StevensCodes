"use strict";
const Mock = require('mockjs');
const uuidv4 = require('uuid/v4');
const Random = Mock.Random;

const model = require('../data/models');
const Task = model.getModel("Task");

async function createTask(num) {
    let tasks = [];

    for (let i = 0; i < num; i++) {
        let anId = uuidv4();
        let aTitle = Random.word(4, 10);
        let aDesc = Random.word(8, 30);
        let aHour = Random.integer(1, 100);
        let aCom = Random.boolean();

        tasks.push(anId);

        console.log({
            title: aTitle,
            id: anId
        });

        let task = {
            id: anId,
            title: aTitle,
            description: aDesc,
            hoursEstimated: aHour,
            completed: aCom,
            comments: []
        }

        const taskModel = new Task(task);
        await taskModel.save();
    }
    return tasks;
}

async function createComments(tasksIds) {
    for (let i = 0; i < tasksIds.length; i++) {
        let taskId = tasksIds[i];
        let commentId = uuidv4();
        let numberOfComments = Random.integer(0, 50);

        for (let j = 0; j < numberOfComments; j++) {
            await Task.updateOne({
                id: taskId
            }, {
                '$addToSet': {
                    comments: {
                        id: commentId,
                        name: Random.name(),
                        comment: Random.word(3, 15)
                    }
                }
            });
        }
    }
}

async function createMockData(num) {
    let tasks = await createTask(num);
    await createComments(tasks);
    console.log("Finished Seed");
    return;
}

createMockData(50);