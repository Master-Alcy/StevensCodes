const postRoutes = require("./posts");
const userRoutes = require("./users");
const path = require("path");

const constructorMethod = app => {
  app.use("/posts", postRoutes);
  app.use("/users", userRoutes);
  app.get("/about", (req, res) => {
    /* static mean a file meant not to be changed
    response.sendFile(file.ext): 
    this method will send a file to the user’s browser; if the browser 
    can render it, it will render it; else it will ask the user to download it.
    ◦ Useful for sending HTML, CSS, image, etc files
    ◦ res.download(file.ext); this method will send a file to the user to be downloaded.*/
    res.sendFile(path.resolve("static/about.html"));
  });

  app.use("*", (req, res) => {
    res.redirect("/posts");
  });
};

module.exports = constructorMethod;