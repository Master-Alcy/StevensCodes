const { getUserId } = require('../utils');

// Check Auth --------------------------------------
function me(parent, args, context, info) {
    const userId = getUserId(context);
    return context.prisma.user({ id: userId });
}

// User Functions --------------------------------------
function getUser(parent, { id, email }, context, info) {
    if (id) {
        return context.prisma.user({ id });
    } else if (email) {
        return context.prisma.user({ email });
    }
    throw new Error("No user found");
}

function allUsers(parent, args, context, info) {
    return context.prisma.users();
}

// Blog Functions ----------------------------------------------------
function getBlog(parent, { id, title }, context, info) {
    if (id) {
        return context.prisma.blog({ id });
    } else if (title) {
        return context.prisma.blog({ title });
    }
    throw new Error("No blog found");
}

function allBlogs(parent, args, context, info) {
    return context.prisma.blogs();
}

function filterBlogsByString(parent, { searchString }, context, info) {
    return context.prisma.blogs({
        where: {
            OR: [
                { title_contains: searchString },
                { article_contains: searchString }
            ]
        }
    });
}

function filterBlogsByLikes(parent, { minLikes }, context, info) {
    return context.prisma.comments({
        where: {
            likes_gte: minLikes
        }
    });
}

// Comment Functions ---------------------------------------------------
function getComment(parent, { id }, context, info) {
    return context.prisma.comment({ id });
}

function allComments(parent, args, context, info) {
    return context.prisma.comments();
}

function filterCommentsByString(parent, { searchString }, context, info) {
    return context.prisma.comments({
        where: {
            content_contains: searchString
        }
    });
}

function filterCommentsByLikes(parent, { minLikes }, context, info) {
    return context.prisma.comments({
        where: {
            likes_gte: minLikes
        }
    });
}

module.exports = {
    me,
    getUser,
    allUsers,
    getBlog,
    allBlogs,
    filterBlogsByString,
    filterBlogsByLikes,
    getComment,
    allComments,
    filterCommentsByString,
    filterCommentsByLikes
}