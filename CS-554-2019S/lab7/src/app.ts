import bodyParser from "body-parser";
import express from "express";
const app = express();

const configRoutes = require("./routes");
const middleWare = require("./utils/middleware");

app.use(bodyParser.json()); // application/json
app.use(bodyParser.urlencoded({ extended: true })); // application/x-www-urlencoded
// Middleware 1: Count website request
app.use(middleWare.mid1);
// Middleware 2: Count path request
app.use(middleWare.mid2);

configRoutes(app);

app.listen(3000, () => {
    // tslint:disable-next-line:no-console
    console.log("Your routes will be running on http://localhost:3000");
});
