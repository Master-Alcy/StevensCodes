const postRoutes = require("./posts");
const userRoutes = require("./users");
/*
app.use([path,] callback [, callback...])
Mounts the specified middleware function or functions at the specified path: 
the middleware function is executed when the base of the requested path matches path.
*/
const constructorMethod = app => {
  app.use("/posts", postRoutes);
  app.use("/users", userRoutes);

  app.use("*", (req, res) => {
    res.status(404).json({ error: "Not found" });
  });
};

module.exports = constructorMethod;
