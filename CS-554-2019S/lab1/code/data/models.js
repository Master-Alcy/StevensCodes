"use strict";
const mongoose = require('mongoose');
const Schema = mongoose.Schema;
const uuidv4 = require('uuid/v4');

const config = require('./config');
const DB_URL = config.serverUrl + config.database;

mongoose.connect(DB_URL, {
    useNewUrlParser: true
}, (err) => {
    if (err) {
        console.warn('cannot connected to database! ' + err)
    } else {
        console.log('connected to datbase: ' + DB_URL)
    }
});

const taskSchema = new Schema({
    id: {
        type: String,
        required: true,
        default: uuidv4 // Note this might got problems
    },
    title: {
        type: String,
        required: true
    },
    description: String,
    hoursEstimated: Number,
    completed: Boolean,
    comments: [{
        id: {
            type: String,
            required: true,
            default: uuidv4 // Note this might got problems
        },
        name: String,
        comment: String
    }]
});

mongoose.model('Task', taskSchema);

module.exports = {
    getModel: function (name) {
        return mongoose.model(name);
    }
}