"use strict";
const { GraphQLServer } = require("graphql-yoga");
const prisma = require('./data');
const resolvers = require("./graphql");

const server = new GraphQLServer({ 
  typeDefs: './graphql/schema.graphql', 
  resolvers,
  context: request => {
    return {
      ...request,
      prisma
    }
  }
});
  
const options = {
  port: 5555,
  endpoint: "/graphql",
  subscriptions: "/subs",
  playground: "/playground"
};

server.start(options, ({ port }) =>
  console.log(`GraphQL server is running on http://localhost:${port}`)
);