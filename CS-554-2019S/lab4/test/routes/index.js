const redisRoute = require('./redisRoute');

const constructorMethod = app => {
    app.use("/api/people", redisRoute);

    app.use("*", (req, res) => {
        res.sendStatus(404).json({ error: "Not found in routes/index.js" });
    });
};

module.exports = constructorMethod;