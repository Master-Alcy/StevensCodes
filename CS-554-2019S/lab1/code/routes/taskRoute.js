const express = require("express");
const router = express.Router();
const task = require("../data");
const taskData = task.tasks;

router.get("/", async (req, res) => {
    try {
        const resData = await taskData.getAllTasks(req.query.skip, req.query.take);

        if (resData.success) {
            res.status(200).json({
                data: resData.data
            });
        } else {
            res.status(500).json({
                error: resData.desc
            });
        }
    } catch (e) {
        res.status(500).json({
            error: "At getAll. " + e
        });
    }
});

module.exports = router;