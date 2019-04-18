"use strict"
const { GraphQLServer } = require('graphql-yoga')

const typeDefs = `
type Query {
    info: String!
}
`

const resolvers = {
    Query: {
        // info: () => `This is the API of a Hackernews Clone`
        info: () => null
    }
}

const server = new GraphQLServer({
    typeDefs,
    resolvers
})

server.start(() => {
    console.log(`Server is running on http://localhost:4000`)
})