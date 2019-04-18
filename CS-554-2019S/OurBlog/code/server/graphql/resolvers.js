// fake data
let links = [
  {
    id: "link-0",
    url: "www.howtographql.com",
    description: "Fullstack tutorial for GraphQL"
  },
  {
    id: "link-1",
    url: "www.howtographql.com",
    description: "Fullstack tutorial for GraphQL"
  },
  {
    id: "link-2",
    url: "www.howtographql.com",
    description: "Fullstack tutorial for GraphQL"
  }
];

let idCount = links.length;
const resolvers = {
  Query: {
    info: () => `Testing GraphQL Server`,
    feed: () => links
  },
  // parent is the result of the previous resolver execution level
  // Optional
  Link: { // parent here linked to links[i]
    id: parent => parent.id,
    description: parent => parent.description,
    url: parent => parent.url
  },
  Mutation: {
    post: (parent, args) => {
      const link = {
        id: `link-${idCount++}`,
        description: args.description,
        url: args.url,
      }
      links.push(link);
      return link;
    }
  }
}

module.exports = resolvers;