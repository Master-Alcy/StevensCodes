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
    try {
        const {title, description, hoursEstimated, completed} =  req.body;
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
    try {
        const {title, description, hoursEstimated, completed} = req.body;
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

router.post("/:id/comments", async (req, res) => {
    try {
        const {name, comment} = req.body;
        const newTask = await taskData.addComment(req.params.id, name, comment);

        if (newTask.success)
            res.status(200).json({data: newTask.data});
        else
            res.status(500).json({error: newTask.desc});
    } catch (e) {
        res.status(500).json({error: "At postTask: " + e});
    }
});

router.delete("/:id/:commentId", async (req, res) => {
    
});

module.exports = router;