const express = require("express");
const router = express.Router();
const data = require("../data");
const userData = data.users;
/*
200-299 range indicate a successful operation
300-399 range indicate some sort of redirection must occur
400-499 range indicate an error was made by the client during the request
500-599 range indicate some sort of error occurred on the server
*/
/*
get/post/put/delete
*/
router.get("/:id", async (req, res) => {
  try {
    const user = await userData.getUserById(req.params.id);
    res.json(user);
  } catch (e) {
    res.status(404).json({ message: "not found!" });
  }
});

router.get("/", async (req, res) => {
  try {
    const userList = await userData.getAllUsers();
    res.json(userList);
  } catch (e) {
    // Something went wrong with the server!
    res.status(500).send();
  }
});

router.post("/", async (req, res) => {
  // Not implemented
  res.status(501).send();
});

module.exports = router;
