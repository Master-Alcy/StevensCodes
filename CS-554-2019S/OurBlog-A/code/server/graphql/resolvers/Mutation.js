const bcrypt = require('bcryptjs');
const jwt = require('jsonwebtoken');
const { APP_SECRET, getUserId } = require('../utils');

// Auth -----------------------------------------------------------------
async function signup(parent, args, context, info) {
    const password = await bcrypt.hash(args.password, 10);
    const user = await context.prisma.createUser({ ...args, password });
    const token = jwt.sign({ userId: user.id }, APP_SECRET);
    return { token, user };
}

async function login(parent, args, context, info) {
    const user = await context.prisma.user({ email: args.email });
    if (!user) { throw new Error('No such user found'); }
    const valid = await bcrypt.compare(args.password, user.password);
    if (!valid) { throw new Error('Invalid password'); }
    const token = jwt.sign({ userId: user.id }, APP_SECRET);
    return { token, user };
}

// CREATE -----------------------------------------------------------------
function postBlog(parent, args, context, info) {
    const userId = getUserId(context);
    return context.prisma.createBlog({
        title: args.title,
        article: args.article,
        postedBy: {
            connect: {
                id: userId
            }
        }
    });
}

function postComment(parent, args, context, info) {
    const userId = getUserId(context);
    return context.prisma.createComment({
        content: args.content,
        postedBy: {
            connect: {
                id: userId
            }
        },
        forBlog: {
            connect: {
                id: args.blogId
            }
        }
    });
}

// UPDATE -----------------------------------------------------------------
function updateUser(parent, args, context, info) {
    const userId = getUserId(context);
    return context.prisma.updateUser({
        where: { id: userId },
        data: {
            name: args.name,
            password: args.password,
            email: args.newEmail,
            phone: args.phone,
            address: args.address,
            interest: args.interest
        }
    });
}

async function updateBlog(parent, args, context, info) {
    const userId = getUserId(context);
    const author = await context.prisma.blog({ id: args.id }).postedBy();
    if (author.id !== userId) {
        throw new Error(`Blog: ${args.id} is not posted by User: ${userId}`);
    }
   
    return context.prisma.updateBlog({
        where: { id: args.id },
        data: {
            title: args.title,
            article: args.article,
            likes: args.likes
        }
    });
}

async function updateComment(parent, args, context, info) {
    const userId = getUserId(context);

    return context.prisma.updateComment({
        where: { id: args.id },
        data: {
            content: args.content,
            likes: args.likes
        }
    });
}

module.exports = {
    signup,
    login,
    postBlog,
    postComment,
    updateUser,
    updateBlog
}