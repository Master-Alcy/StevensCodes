const find = require('lodash/find');
const filter = require('lodash/filter');
const sumBy = require('lodash/sumBy');
const remove = require("lodash/remove");
const uuid = require("node-uuid");
const {
    GraphQLInt,
    GraphQLBoolean,
    GraphQLString,
    GraphQLList,
    GraphQLObjectType,
    GraphQLNonNull,
    GraphQLSchema,
} = require("graphql");

const Users = require('./data/users');
const Todos = require('./data/todos');

const UserType = new GraphQLObjectType({
    name: 'User',
    description: 'Users in company',
    fields: () => ({
        id: {type: new GraphQLNonNull(GraphQLString)},
        first_name: {type: new GraphQLNonNull(GraphQLString)},
        last_name: {type: new GraphQLNonNull(GraphQLString)},
        email: {type: GraphQLString},
        gender: {type: GraphQLString},
        department: {type: new GraphQLNonNull(GraphQLString)},
        country: {type: new GraphQLNonNull(GraphQLString)},
        todo_count: {
            type: GraphQLInt,
            resolve: (user) => {
                return sumBy(Todos, todo => todo.userId === user.id ? 1:0);
            }
        },
        todos: {
            type: new GraphQLList(TodoType),
            resolve: (user, args) => {
                return filter(Todos, todo => todo.userId === user.id);
            }
        }
    })
});

const TodoType = new GraphQLObjectType({
    name: 'Todo',
    description: 'Task for user',
    fields: () => ({
        id: {type: new GraphQLNonNull(GraphQLString)},
        title: {type: GraphQLString},
        completed: {type: new GraphQLNonNull(GraphQLBoolean)},
        user: {
            type: UserType,
            resolve: (todo, args) => {
                return find(Users, user => user.id === todo.userId);
            }
        }
    })
});

const TodoQueryRootType = new GraphQLObjectType({
    name: 'TodoAppSchema',
    description: 'Root Todo App Schema',
    fields: () => ({
        users: {
            args: {
                first_name: {type: GraphQLString},
                last_name: {type: GraphQLString},
                department: {type: GraphQLString},
                country: {type: GraphQLString},
            },
            type: new GraphQLList(UserType),
            description: 'List of Users',
            resolve: (parent, args) => {
                if (Object.keys(args).length) {
                    return filter(Users, args);
                }
                return Users;
            }
        },
        todos: {
            args: {
                userId: {type: GraphQLString},
                completed: {type: GraphQLBoolean},
            },
            type: new GraphQLList(TodoType),
            description: 'List of Todos',
            resolve: (parent, args) => {
                if (Object.keys(args).length) {
                    return filter(Todos, args);
                }
                return Todos;
            }
        }
    })
});

const TodoMutationType = new GraphQLObjectType({
    name: "TodoMutation",
    description: "Todo mutation type",
    fields: {
        createTodo: {
            type: TodoType,
            args: {
                title: {type: new GraphQLNonNull(GraphQLString) },
                userId: {type: new GraphQLNonNull(GraphQLString)}
            },
            resolve: (parent, args) => {
                const newObj = {
                    userId: args.userId,
                    id: uuid.v4(),
                    title: args.title,
                    completed: false
                }
                Todos.push(newObj);
                return newObj;
            }
        },
        updateTodo: {
            type: TodoType,
            args: {
                id: {type: new GraphQLNonNull(GraphQLString)},
                title: {type: new GraphQLNonNull(GraphQLString)},
                userId: {type: new GraphQLNonNull(GraphQLString)},
                completed: {type: new GraphQLNonNull(GraphQLBoolean)}
            },
            resolve: (parent, args)=>{
                const index = Todos.findIndex(t => t.id === args.id);
                Todos[index].title = args.title;
                Todos[index].userId = args.userId;
                Todos[index].completed = args.completed;
                return Todos[index];
            }
        },
        deleteTodo: {
            type: new GraphQLList(TodoType),
            args: {
                id: {type: new GraphQLNonNull(GraphQLString)}
            },
            resolve: (parent, args)=>{
                remove(Todos, t => t.id === args.id);
                return Todos;
            }
        }
    }
});

const schema = new GraphQLSchema({
    query: TodoQueryRootType,
    mutation: TodoMutationType
});

module.exports = schema;