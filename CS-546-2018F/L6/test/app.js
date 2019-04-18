const express = require("express");
const app = express();
//require a folder is require the index.js inside that folder
//also add index.js into all folders are recommanded
const configRouters = require("./routes");
//This is constructorMethod in index.js
//give app real router values
configRouters(app);
//app.METHOD(PATH, HANDLER)
/*
app.listen([port[, host[, backlog]]][, callback])
Binds and listens for connections on the specified host and port. 
This method is identical to Node’s http.Server.listen().
*/
app.listen(3000, () => {
  console.log("We've now got a server!");
  console.log("Your routes will be running on http://localhost:3000");
});
/*
When running a server, running npm start should start your server 
and print a message with its address (including port).
You will have:
◦ A file that creates, configures, and runs your server (app.js)
◦ A folder with all your route modules (./routes)
◦ An index file in the route folder that returns a function that attaches 
all your routes to your app (./routes/index.js)
◦ Route modules (./routes/posts.js)
◦ A folder for your data access layer modules (./data)
◦ Your connection (./data/mongoConnection.js)
◦ Your collection file (./data/mongoCollection.js)
◦ Your data modules (./data/posts.js)
◦ Potentially, an index file that exports all other data access modules
You may require a folder by placing a file called index.js inside the folder
◦ res.json(someData) will send a JSON object as the response with 
a status code of 200 (unless otherwise specified)
◦ res.sendStatus(statusCode) will issue a response with the provided status code
*/