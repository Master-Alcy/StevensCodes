const mongoCollections = require("./mongoCollections");
const dogs = mongoCollections.dogs;

module.exports = {
  // This is a fun new syntax that was brought forth in ES6, where we can define
  // methods on an object with this shorthand!
  
  // retrieve documents by querying for matching properties.
  //We can also search for dogs based on matching names, or other properties
  async getDogById(id) {
    if (!id) throw "You must provide an id to search for";

    const dogCollection = await dogs();
    const doggo = await dogCollection.findOne({ _id: id });
    if (doggo === null) throw "No dog with that id";

    return doggo;
  },

  async getAllDogs() {
    const dogCollection = await dogs();

    const dogs = await dogCollection.find({}).toArray();

    return dogs;
  },

  // you insert documents; these documents are justJSON objects
  async addDog(name, breeds) {
    if (!name) throw "You must provide a name for your dog";

    if (!breeds || !Array.isArray(breeds))
      throw "You must provide an array of breeds";

    if (breeds.length === 0) throw "You must provide at least one breed.";
    const dogCollection = await dogs();

    let newDog = {
      name: name,
      breeds: breeds
    };

    const insertInfo = await dogCollection.insertOne(newDog);
    if (insertInfo.insertedCount === 0) throw "Could not add dog";

    const newId = insertInfo.insertedId;

    const dog = await this.getDogById(newId);
    return dog;
  },

  //delete one or more documents at a time by passing 
  //an object that describes what documents you want to match
  async removeDog(id) {
    if (!id) throw "You must provide an id to search for";

    const dogCollection = await dogs();
    const deletionInfo = await dogCollection.removeOne({ _id: id });

    if (deletionInfo.deletedCount === 0) {
      throw `Could not delete dog with id of ${id}`;
    }
  },

  //passing an object that describes what documents you want to match, 
  //and a document describing how you want the update to occur. For now, 
  //we will be replacing the document entirely by passing a new version of the document
  async updateDog(id, name, breeds) {
    if (!id) throw "You must provide an id to search for";

    if (!name) throw "You must provide a name for your dog";

    if (!breeds || !Array.isArray(breeds))
      throw "You must provide an array of breeds";

    if (breeds.length === 0) throw "You must provide at least one breed.";

    const dogCollection = await dogs();
    const updatedDog = {
      name: name,
      breeds: breeds
    };

    const updateInfo = await dogCollection.updateOne({ _id: id }, updatedDog);
    if (updateInfo.modifiedCount === 0) {
      throw "could not update dog successfully";
    }

    return await this.getDogById(id);
  }
};
