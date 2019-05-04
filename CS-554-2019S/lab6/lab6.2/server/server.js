const express = require('express');
const graphqlHTTP = require('express-graphql');
const cors = require('cors');
const schema = require('./src/schema.js');
const app = express();

app.use('*', cors({ credentials: true }));
app.use('/', graphqlHTTP({
  schema,
  graphiql: true
}));

const PORT = process.env.PORT || 4000;
app.listen(PORT);
console.log(`GraphQL API server running at localhost:${PORT}`);