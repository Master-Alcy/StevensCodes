const gql = `
type Query {
    info: String!
    feed: [Link!]!
}

type Link {
    id: ID!
    description: String!
    url: String!
}

type Mutation {
    post(url: String!, description: String!): Link!
}
`;

module.exports = gql;