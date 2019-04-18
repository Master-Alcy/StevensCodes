"use strict";
const express = require("express");
const bodyParser = require("body-parser");
const cookieParser = require("cookie-parser");
const exphbs = require("express-handlebars");
const Handlebars = require("handlebars");

const app = express();
const configRoutes = require("./routes");
const staticHandler = express.static(__dirname + "/public");
const middleWare = require("./middleware");

const handlebarsInstance = exphbs.create({
    defaultLayout: "main",
    layoutsDir: 'views/layouts',
    helpers: {
        asJSON: (obj, spacing) => {
            if (typeof spacing === "number") {
                return new Handlebars.SafeString(JSON.stringify(obj, null, spacing));
            }
            return new Handlebars.SafeString(JSON.stringify(obj));
        }
    }
});

app.use("/public", staticHandler);
app.use(cookieParser());
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: true }));
//Middleware 1: Count website request
app.use(middleWare.mid1);
//Middleware 2: Count path request
app.use(middleWare.mid2);
//two more middlewars in routes

app.engine("handlebars", handlebarsInstance.engine);
app.set("view engine", "handlebars");

configRoutes(app);

app.listen(3000, function () {
    console.log("Your server is now listening on port 3000! "
    + "Navigate to http://localhost:3000 to access it");
    if (process && process.send) process.send({ done: true });
});