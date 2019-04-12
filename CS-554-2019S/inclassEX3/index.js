const { ApolloServer, gql } = require('apollo-server');
const Random = require('mockjs').Random;

let users = [
	{
		id: 1,
		name: Random.word(5),
		blogs: [
			{id: 1},
			{id: 2}
		]
	},
	{
		id: 2,
		name: Random.word(5),
		blogs: [
			{id: 3}
		]
	},
	{
		id: 3,
		name: Random.word(5),
		blogs: [
			{id: 4},
			{id: 5}
		]
	},
	{
		id: 4,
		name: Random.word(5),
		blogs: [
			{id: 6}
		]
	},
	{
		id: 5,
		name: Random.word(5),
		blogs: [
			{id: 7}
		]
	}
];

let blogs = [
	{
		id: 1,
		content: Random.sentence(3, 7)
	},
	{
		id: 2,
		content: Random.sentence(3, 7)
	},
	{
		id: 3,
		content: Random.sentence(3, 7)
	},
	{
		id: 4,
		content: Random.sentence(3, 7)
	},
	{
		id: 5,
		content: Random.sentence(3, 7)
	},
	{
		id: 6,
		content: Random.sentence(3, 7)
	},
	{
		id: 7,
		content: Random.sentence(3, 7)
	}
];

const typeDefs = gql`
	type Query {
		users: [User]
		blogs: [Blog]
		user(id: Int): User
		blog(id: Int): Blog
	}

	type User {
		id: Int
		name: String
		blogs: [Blog]
		users: [User]
	}

	type Blog {
		id: Int
		content: String
		blogs: [Blog]
	}
`;

const resolvers = {
	Query: {
		users: () => users,
		blogs: () => blogs
	},
	User: {
		users: (parentValue) => {
			return users.filter((e) => e.id === parentValue.id);
		}
	},
	Blog: {
		blogs: (parentValue) => {
			return blogs.filter((e) => e.id === parentValue.id);
		}
	}
};

const server = new ApolloServer({ typeDefs, resolvers });

server.listen().then(({ url }) => {
	console.log(`🚀  Server ready at ${url} 🚀`);
});
