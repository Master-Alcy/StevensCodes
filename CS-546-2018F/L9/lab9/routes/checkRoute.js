"use strict";
const express = require("express");
const router = express.Router();

router.get("/", (req, res) => {
  try {
    res.render("checker/static", { });
  } catch (e) {
    res.status(500).json({ error: "At get /. " + e });
  }
});

module.exports = router;