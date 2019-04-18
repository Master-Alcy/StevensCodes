const express = require("express");
const router = express.Router();
const data = require("../data");
const postData = data.posts;
//This is the data methods
//posts is a double calling to users
/*
app.get(path, callback [, callback ...])
Routes HTTP GET requests to the specified path with 
the specified callback functions.
*/
router.get("/:id", async (req, res) => {
  try {
    const post = await postData.getPostById(req.params.id);
    res.json(post);
  } catch (e) {
    res.status(404).json({ message: "Post not found" });
    /*
    res.json([body])
    Sends a JSON response. This method sends a response 
    (with the correct content-type) that is the parameter converted 
    to a JSON string using JSON.stringify().
    */
  }
});

router.get("/", async (req, res) => {
  try {
    const postList = await postData.getAllPosts();
    res.json(postList);
  } catch (e) {
    res.status(500).send();
    /*
    res.send([body])
    Sends the HTTP response.
    */
  }
});

router.post("/", async (req, res) => {
  // Not implemented
  res.status(501).send();
});

module.exports = router;
