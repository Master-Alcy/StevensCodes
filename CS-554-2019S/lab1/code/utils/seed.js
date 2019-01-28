"use strict";
const Mock = require('mockjs');
const uuidv4 = require('uuid/v4');
const Random = Mock.Random;

const model = require('../data/models');
const Task = model.getModel("Task");

async function createTask(num) {
    
}