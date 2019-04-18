const express = require("express");
const app = express();
const configRouters = require("./routes");

configRouters(app);

app.listen(3000, () => {
    console.log("New server with routes on http://localhost:3000");
});