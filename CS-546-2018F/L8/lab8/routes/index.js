const postRoutes = require("./posts");

const constructorMethod = app => {
  app.use("/", postRoutes);

  app.use("*", (req, res) => {
    res.redirect("/");
  });
};

module.exports = constructorMethod;