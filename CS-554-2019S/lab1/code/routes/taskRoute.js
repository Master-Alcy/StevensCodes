"use strict";
const express = require("express");
const router = express.Router();
const task = require("../data");
const taskData = task.tasks;

router.get("/", async (req, res) => {
    try {
        const resData = await taskData.getAllTasks(req.query.skip, req.query.take);

        if (resData.success)
            res.status(200).json({data: resData.data});
        else
            res.status(500).json({error: resData.desc});
    } catch (e) {
        res.status(500).json({error: "At getAll: " + e});
    }
});

router.get("/:id", async (req, res) => {
    try {
        const resData = await taskData.getTaskById(req.params.id);

        if (resData.success)
            res.status(200).json({data: resData.data});
        else
            res.status(500).json({error: resData.desc});
    } catch (e) {
        res.status(500).json({error: "At getOne: " + e});
    }
});

router.post("/", async (req, res) => {
    const reqBody = req.body;
    try {
        const {title, description, hoursEstimated, completed} = reqBody;
        const newTask = await taskData.addTask(title, description, hoursEstimated, completed);

        if (newTask.success)
            res.status(200).json({data: newTask.data});
        else
            res.status(500).json({error: newTask.desc});
    } catch (e) {
        res.status(500).json({error: "At postTask: " + e});
    }
});

router.put("/:id", async (req, res) => {
    const reqBody = req.body;
    try {
        const {title, description, hoursEstimated, completed} = reqBody;
        const updatedTask = await taskData.updateWholeTaskById(req.params.id, title, description, hoursEstimated, completed);

        if (updatedTask.success)
            res.status(200).json({data: updatedTask.data});
        else
            res.status(500).json({error: updatedTask.desc});
    } catch (e) {
        res.status(500).json({error: "At put: " + e});
    }
});

router.patch("/:id", async (req, res) => {
    try {
        const updatedTask = await taskData.updatePartialTaskById(req.params.id, req.body);

        if (updatedTask.success)
            res.status(200).json({data: updatedTask.data});
        else
            res.status(500).json({error: updatedTask.desc});
    } catch (e) {
        res.status(500).json({error: "At patch: " + e});
    }
});

module.exports = router;