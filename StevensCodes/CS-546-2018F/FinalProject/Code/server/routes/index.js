const bookRoutes = require("./books");
const userRoutes = require("./users");
const path = require('path');

const constructorMethod = app => {
    app.use("/user", userRoutes);
    app.use("/book", bookRoutes);
    // This is starting the client routes
    app.get('*', (req, res) => {
        res.sendFile(path.resolve(`${__dirname}/../../client/dist/index.html`));
    });
}

module.exports = constructorMethod;