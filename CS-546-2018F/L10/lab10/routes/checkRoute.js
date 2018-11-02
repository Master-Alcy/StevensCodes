"use strict";
const express = require("express");
const router = express.Router();
const middleWare = require("../middleware");

router.get("/", (req, res) => {
  try {
    const Auth = req.cookies.AuthCookie;
    if (Auth) {
      console.log(Auth);
      res.redirect("/private");
    } else {
      console.log("AuthCookie not exist.");
      res.render("checker/login", {});
    }
  } catch (e) {
    res.status(500).json({ error: "At get /. " + e });
  }
});

router.get("/login", (req, res) => {
  try {
    console.log("get/login");
    res.redirect("/");
  } catch (e) {
    res.status(500).json({ error: "At get /login. " + e });
  }
});

router.get("/private",middleWare.protectPrivate, (req, res,next) => {
  try {
    const data = req.cookies.AuthCookie;
    res.render("checker/private", {
      UN: data.username,
      FN: data.FirstName,
      LN: data.LastName,
      PR: data.Profession,
      BI: data.Bio
    });
  } catch (e) {
    res.status(500).json({ error: "At get /private. " + e });
  }
});

router.get("/logout", (req, res) => {
  try {
    res.clearCookie("AuthCookie");
    res.render("checker/logout", {});
  } catch (e) {
    res.status(500).json({ error: "At get /logout. " + e });
  }
});

router.post("/login", middleWare.authentication, (req, res, next) => {
  try {
    console.log("login success");
    res.redirect("/private");
  } catch (e) {
    res.status(400).json({ error: "At post /login. " + e });
  }
});

module.exports = router;