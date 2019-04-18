"use strict";
const checkRoute = require("./checkRoute");

const constructorMethod = app => {
  app.use("/", checkRoute);

  app.use("*", (req, res) => {
    res.redirect("/");
  });
};

module.exports = constructorMethod;