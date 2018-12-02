const bookRoutes = require("./books");
const userRoutes = require("./users");
const path = require('path');
const connect = require('../data/models');

const constructorMethod = app => {
    app.use("/user", userRoutes);
    app.use("/book", bookRoutes);

    app.get('*', (req, res) => {
        res.sendFile(path.resolve(`${__dirname}/../../client/dist/index.html`));
    });
}

module.exports = constructorMethod;