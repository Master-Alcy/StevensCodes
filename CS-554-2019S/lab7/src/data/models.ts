import mongoose from "mongoose";
const Schema = mongoose.Schema;

const config = require("./config");
const DB_URL = config.serverUrl + config.database;

mongoose.connect(DB_URL, {
    useNewUrlParser: true
}, (err) => {
    if (err) {
        console.warn("cannot connected to database! " + err);
    } else {
        console.log("connected to datbase: " + DB_URL);
    }
});

const taskSchema = new Schema({
    id: {
        type: String,
        required: true
    },
    title: {
        type: String,
        required: true
    },
    description: String,
    hoursEstimated: Number,
    completed: Boolean,
    comments: [{
        _id: false,
        id: {
            type: String,
            required: true
        },
        name: String,
        comment: String
    }]
});

mongoose.model("Task", taskSchema);

module.exports = {
    getModel(name: string) {
        return mongoose.model(name);
    }
};
