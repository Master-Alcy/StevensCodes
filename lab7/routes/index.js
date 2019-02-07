const postRoutes = require("./posts");

const constructorMethod = app => {
  app.use("/recipes", postRoutes);

  app.use("*", (req, res) => {
    res.sendStatus(404).json({error: "Not found in routes/index.js"});
  });
};

module.exports = constructorMethod;