const Query = require('./resolvers/Query');
const Mutation = require('./resolvers/Mutation');
const User = require('./resolvers/User');
const Blog = require('./resolvers/Blog');
const Comment = require('./resolvers/Comment');
const Tag = require('./resolvers/Tag');

const resolvers = {
  Query,
  Mutation,
  User,
  Blog,
  Comment,
  Tag
}

module.exports = resolvers;

/**
 * parent --> parent is the result of the previous resolver execution level
 * Resolver for Type itself like Link is not needed
 * 
 * context --> is a plain JS object that every resolver in the resolver chain can read from and write to
 * It thus basically is a means for resolvers to communicate
 */