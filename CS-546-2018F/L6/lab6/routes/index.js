const dataOnRoutes = require("./listing");

const constructorMethod = app => {
    app.use("/", dataOnRoutes);

    app.use("*", (req,res) => {
        res.status(404).json({error : "Not found, enter '/about' or so."});
    });
}

module.exports = constructorMethod;