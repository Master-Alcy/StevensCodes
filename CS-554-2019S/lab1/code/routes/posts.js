const express = require("express");
const router = express.Router();
const data = require("../data");
const postData = data.posts;

router.get("/", async (req, res) => {
    try {
        const postList = await postData.getAllPosts();
        let head = 0, tail = 20;

    } catch (e) {
        res.status(500).json({
            error: "At getAll. " + e
        });
    }
});

router.get("/:id", async (req, res) => {
    try {
        const post = await postData.getPostById(req.params.id);
        res.json(post);
    } catch (e) {
        res.status(500).json({
            error: "At getId. Post not found!"
        });
    }
});

router.post("/", async (req, res) => {
    const blogPostData = req.body;
    try {
        const {
            title,
            ingredients,
            steps
        } = blogPostData;
        const newPost = await postData.addPost(title, ingredients, steps);
        res.json(newPost);
    } catch (e) {
        res.status(500).json({
            error: "At post. " + e
        });
    }
});

router.put("/:id", async (req, res) => {
    try {
        await postData.getPostById(req.params.id);
    } catch (e) {
        res.status(500).json({
            error: "At putId. Post not found!"
        });
    }

    const updatedData = req.body;
    try {
        const updatedPost = await postData.updateWholePost(req.params.id, updatedData);
        res.json(updatedPost);
    } catch (e) {
        res.status(500).json({
            error: "At putId. " + e
        });
    }
});

router.patch("/:id", async (req, res) => {
    try {
        await postData.getPostById(req.params.id);
    } catch (e) {
        res.status(500).json({
            error: "At patchId. Post not found!"
        });
    }

    const updatedData = req.body;
    try {
        const updatedPost = await postData.updatePost(req.params.id, updatedData);
        res.json(updatedPost);
    } catch (e) {
        res.status(500).json({
            error: "At patchId. " + e
        });
    }
});

router.post("/:id/comments", async (req, res) => {
    const blogPostData = req.body;
    try {
        const {
            title,
            ingredients,
            steps
        } = blogPostData;
        const newPost = await postData.addPost(title, ingredients, steps);
        res.json(newPost);
    } catch (e) {
        res.status(500).json({
            error: "At post. " + e
        });
    }
});

router.delete("/:taskId/:commentId", async (req, res) => {
    try {
        await postData.getPostById(req.params.id);
    } catch (e) {
        res.status(500).json({
            error: "At deleteId. Post not found"
        });
    }

    try {
        await postData.removePost(req.params.id);
    } catch (e) {
        res.status(500).json({
            error: "At deleteId" + e
        });
    }
});

module.exports = router;