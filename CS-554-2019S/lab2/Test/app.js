const express = require("express");
const app = express();

const static = express.static(__dirname + "/public");

app.use(static); // Why not app.use("/public", static)

app.use("/*", (req, res) => {
    res.status(404).json({error: `404: page not found`});
});


app.listen(3000, () => {
    console.log("Single page route at http://localhost:3000/");
})