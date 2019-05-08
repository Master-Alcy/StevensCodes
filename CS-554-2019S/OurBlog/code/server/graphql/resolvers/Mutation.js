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
    console.log(userId);
    const author = await context.prisma.blog({ id: args.id }).postedBy();
    console.log(author.id);
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
    const author = await context.prisma.comment({ id: args.id }).postedBy();
    if (author.id !== userId) {
        throw new Error(`Comment: ${args.id} is not posted by User: ${userId}`);
    }

    return context.prisma.updateComment({
        where: { id: args.id },
        data: {
            content: args.content,
            likes: args.likes
        }
    });
}

async function likeBlog(parent, args, context, info) {
    const Blog = await context.prisma.blog({ id: args.id });   
    return context.prisma.updateBlog({
        where: { id: args.id },
        data: {
            likes: Blog.likes + 1
        }
    });
}

async function likeComment(parent, args, context, info) {
    const Comment = await context.prisma.comment({ id: args.id });   
    return context.prisma.updateComment({
        where: { id: args.id },
        data: {
            likes: Comment.likes + 1
        }
    });
}

// DELETE -----------------------------------------------------------------
async function deleteUser(parent, args, context, info) {
    const userId = getUserId(context);
    const author = await context.prisma.user({ id: args.id });
    if (author.id !== userId) {
        throw new Error(`User: ${userId} is not authorized to delete User: ${args.id}`);
    }

    return context.prisma.deleteUser({
        id: args.id
    });
}

async function deleteBlog(parent, args, context, info) {
    const userId = getUserId(context);
    const author = await context.prisma.blog({ id: args.id }).postedBy();
    if (author.id !== userId) {
        throw new Error(`User: ${userId} is not authorized to delete Blog: ${args.id}`);
    }

    return context.prisma.deleteBlog({
        id: args.id
    });
}

async function deleteComment(parent, args, context, info) {
    const userId = getUserId(context);
    const author = await context.prisma.comment({ id: args.id }).postedBy();
    if (author.id !== userId) {
        throw new Error(`User: ${userId} is not authorized to delete Comment: ${args.id}`);
    }

    return context.prisma.deleteComment({
        id: args.id
    });
}

module.exports = {
    signup,
    login,
    postBlog,
    postComment,
    updateUser,
    updateBlog,
    updateComment,
    likeBlog,
    likeComment,
    deleteUser,
    deleteBlog,
    deleteComment
}