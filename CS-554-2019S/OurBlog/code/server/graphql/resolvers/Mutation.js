const bcrypt = require('bcryptjs');
const jwt = require('jsonwebtoken');
const { APP_SECRET, getUserId } = require('../utils');
const solr = require('../../solr');

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
async function postBlog(parent, args, context, info) {
    const userId = getUserId(context);
    const Blog = await context.prisma.createBlog({
        title: args.title,
        article: args.article,
        postedBy: {
            connect: {
                id: userId
            }
        }
    });

    const esData = await solr.createSolrCompatibleDocument(Blog.id, Blog.title, Blog.article);
    await solr.update(esData);
    return Blog;
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

function postTag(parent, args, context, info) {
    const userId = getUserId(context);
    if (!userId) {
        throw new Error("Only login user can add tags");
    }
    return context.prisma.createTag({
        tag: args.tag,
        postedBy: {
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
    if (args.id) {
        const author = await context.prisma.blog({ id: args.id }).postedBy();
        if (author.id !== userId) {
            throw new Error(`Blog: ${args.id} is not posted by User: ${userId}`);
        }
       
        return context.prisma.updateBlog({
            where: { id: args.id },
            data: {
                title: args.newTitle,
                article: args.article,
                likes: args.likes
            }
        });
    } else if (args.title) {
        const author = await context.prisma.blog({ title: args.title }).postedBy();
        if (author.id !== userId) {
            throw new Error(`Blog: ${args.title} is not posted by User: ${userId}`);
        }
       
        return context.prisma.updateBlog({
            where: { title: args.title },
            data: {
                title: args.newTitle,
                article: args.article,
                likes: args.likes
            }
        });
    }
    throw new Error("No unique identifier for Blog provided");
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

async function likeBlog(parent, { id, title }, context, info) {
    if (id) {
        const Blog = await context.prisma.blog({ id });   
        return context.prisma.updateBlog({
            where: { id },
            data: {
                likes: Blog.likes + 1
            }
        });
    } else if (title) {
        const Blog = await context.prisma.blog({ title });   
        return context.prisma.updateBlog({
            where: { title },
            data: {
                likes: Blog.likes + 1
            }
        });
    }
    throw new Error("No unique identifier for Blog provided");
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
async function deleteUser(parent, { id, email }, context, info) {
    const userId = getUserId(context);
    if (id) {
        const author = await context.prisma.user({ id });
        if (author.id !== userId) {
            throw new Error(`User: ${userId} is not authorized to delete User: ${id}`);
        }
    
        return context.prisma.deleteUser({ id });
    } else if (email) {
        const author = await context.prisma.user({ email });
        if (author.id !== userId) {
            throw new Error(`User: ${userId} is not authorized to delete User: ${email}`);
        }
    
        return context.prisma.deleteUser({ email });
    }
    throw new Error("No unique identifier for User provided");
}

async function deleteBlog(parent, { id, title }, context, info) {
    const userId = getUserId(context);
    const author = await context.prisma.blog({ id }).postedBy();
    if (author.id !== userId) {
        throw new Error(`User: ${userId} is not authorized to delete Blog: ${id}`);
    }

    if (id) {
        const author = await context.prisma.blog({ id }).postedBy();
        if (author.id !== userId) {
            throw new Error(`User: ${userId} is not authorized to delete Blog: ${id}`);
        }

        return context.prisma.deleteBlog({ id });
    } else if (title) {
        const author = await context.prisma.blog({ title }).postedBy();
        if (author.id !== userId) {
            throw new Error(`User: ${userId} is not authorized to delete Blog: ${title}`);
        }

        return context.prisma.deleteBlog({ title });
    }
    throw new Error("No unique identifier for Blog provided");
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

async function deleteTag(parent, { id, tag }, context, info) {
    const userId = getUserId(context);
    if (!userId) {
        throw new Error("Only login user can add tags");
    }

    if (id) {
        return context.prisma.deleteTag({ id });
    } else if (tag) {
        return context.prisma.deleteTag({ tag });
    }
    throw new Error("No unique identifier for Tag provided");
}

module.exports = {
    signup,
    login,
    postBlog,
    postComment,
    postTag,
    updateUser,
    updateBlog,
    updateComment,
    likeBlog,
    likeComment,
    deleteUser,
    deleteBlog,
    deleteComment,
    deleteTag
}