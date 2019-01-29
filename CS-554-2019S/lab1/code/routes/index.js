const postRoutes = require("./posts");
const taskRoutes = require('./taskRoute');

const constructorMethod = app => {
  app.use("/api/tasks", taskRoutes);

  app.use("*", (req, res) => {
    res.sendStatus(404).json({error: "Not found in routes/index.js"});
  });
};

module.exports = constructorMethod;