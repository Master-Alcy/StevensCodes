const express = require("express");
const router = express.Router();
const data = require("../data");
const postData = data.posts;

router.get("/", async (req, res) => {
    try {
        const postList = await postData.getAllPosts();
        res.json(Narrow(postList));
    } catch (e) {
        res.status(500).json({ error: "At getall. " + e });
    }
});

function Narrow(dataList) {
    if (!Array.isArray(dataList)) {
        return [];
    }

    let arr = [];
    dataList.forEach(obj => {
        arr.push({
            "_id": obj._id,
            "title": obj.title
        });
    });
    return arr;
}

router.get("/:id", async (req, res) => {
    try {
        const post = await postData.getPostById(req.params.id);
        res.json(post);
    } catch (e) {
        res.status(404).json({ error: "At getId. Post not found!" });
    }
});

router.post("/", async (req, res) => {
    const blogPostData = req.body;
    try {
        const { title, ingredients, steps } = blogPostData;
        const newPost = await postData.addPost(title, ingredients, steps);
        res.json(newPost);
    } catch (e) {
        res.status(500).json({ error: "At post. " + e });
    }
});

router.put("/:id", async (req, res) => {
    try {
        await postData.getPostById(req.params.id);
    } catch (e) {
        res.status(404).json({ error: "At putId. Post not found!" });
    }

    const updatedData = req.body;
    try {
        const updatedPost = await postData.updateWholePost(req.params.id, updatedData);
        res.json(updatedPost);
    } catch (e) {
        res.status(500).json({ error: "At putId. " + e });
    }
});

router.patch("/:id", async (req, res) => {
    try {
        await postData.getPostById(req.params.id);
    } catch (e) {
        res.status(404).json({ error: "At patchId. Post not found!" });
    }

    const updatedData = req.body;
    try {
        const updatedPost = await postData.updatePost(req.params.id, updatedData);
        res.json(updatedPost);
    } catch (e) {
        res.status(500).json({ error: "At patchId. " + e });
    }
});

router.delete("/:id", async (req, res) => {
    try {
        await postData.getPostById(req.params.id);
    } catch (e) {
        res.status(404).json({ error: "At deleteId. Post not found" });
    }

    try {
        await postData.removePost(req.params.id);
    } catch (e) {
        res.status(500).json({ error: "At deleteId" + e });
    } 
});

module.exports = router;