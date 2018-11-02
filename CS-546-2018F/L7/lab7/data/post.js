const mongoCollections = require("../config/mongoCollections");
const posts = mongoCollections.recipes;
const uuidv1 = require('uuid/v1');

async function getAllPosts() {
    const postCollection = await posts();
    return await postCollection.find({}).toArray();
}

async function getPostById(id) {
    const postCollection = await posts();
    const post = await postCollection.findOne({ _id: id });

    if (!post) throw "Post not found";
    return post;
}

async function addPost(title, ingredients, steps) {
    if (typeof title !== "string") throw "No title provided";

    if (!Array.isArray(ingredients)) {
        ingredients = [];
    }
    if (!Array.isArray(steps)) {
        steps = [];
    }

    const postCollection = await posts();

    const newPost = {
        title: title,
        ingredients: ingredients,
        steps: steps,
        _id: uuidv1()
    };

    const newInsertInformation = await postCollection.insertOne(newPost);
    const newId = newInsertInformation.insertedId;
    return await this.getPostById(newId);
}

async function removePost(id) {
    const postCollection = await posts();
    const deletionInfo = await postCollection.removeOne({ _id: id });
    if (deletionInfo.deletedCount === 0) {
        throw `Could not delete post with id of ${id}`;
    }
}
//undates only supplyed changes
async function updatePost(id, updatedPost) {
    const postCollection = await posts();

    const updatedPostData = {};

    if (updatedPost.title) {
        updatedPostData.title = updatedPost.title;
    }

    if (updatedPost.ingredients) {
        updatedPostData.ingredients = updatedPost.ingredients;
    }

    if (updatedPost.steps) {
        updatedPostData.steps = updatedPost.steps;
    }

    let updateCommand = {
        $set: updatedPostData
    };
    const query = {
        _id: id
    };
    await postCollection.updateOne(query, updateCommand);

    return await this.getPostById(id);
}

async function updateWholePost(id, updatedPost) {
    if (typeof updatedPost.title !== "string") {
        updatedPost.title = "";
    }
    if (!Array.isArray(updatedPost.ingredients)) {
        updatedPost.ingredients = [];
    }
    if (!Array.isArray(updatedPost.steps)) {
        updatedPost.steps = [];
    }

    const postCollection = await posts();

    const updatedPostData = {
        $set: {
        title: updatedPost.title,
        ingredients: updatedPost.ingredients,
        steps: updatedPost.steps
        }
    };

    const query = {
        _id: id
    };

    const updatedInfo = await postCollection.updateOne(query, updatedPostData);
    if (updatedInfo.modifiedCount === 0) {
        throw "could not update recipe successfully";
    }

    return await this.getPostById(id);
}

module.exports = {
    getAllPosts,
    getPostById,
    addPost,
    removePost,
    updatePost,
    updateWholePost
}