const express = require("express");
const bodyParser = require("body-parser");
const app = express();
const configRoutes = require("./routes");

app.use(bodyParser.json());
configRoutes(app);

app.listen(3000, () => {
  console.log("We've now got a server!");
  console.log("Your routes will be running on http://localhost:3000");
});

/*
◦The user tries to request a resource that does not exist
◦The user inputs data that does not make sense (bad arguments / parameters / querystringdata)
◦The user is not authenticated
◦The input the user provides does not make sense
◦The user is attempting to access resources they do not have access to
*/
/*
Whenever input comes from a user, you must check that this input is:
◦Actually there!
◦Actually the type you want!
◦For example, you may have to change from strings to numbers
◦Actually valid!
◦When you write a calculator that you wouldn’t let someone divide by 0

There are two places you will need to perform error checking:
◦Inside of your routes; this will easily catch user submitted errors
◦Inside of your data modules; this will allow you to ensure that you don’t create bad data.
*/