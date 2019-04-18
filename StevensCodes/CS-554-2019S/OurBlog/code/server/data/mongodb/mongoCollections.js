const dbConnection = require("./mongoConnection");

function getCollectionFn (collection) {
  let _col = undefined;

  return async () => {
    if (!_col) {
      const db = await dbConnection();
      _col = await db.collection(collection);
    }
    return _col;
  };
};

module.exports = {
    blogs: getCollectionFn("blogs"),
    users: getCollectionFn("users"),
    comments: getCollectionFn("comments")
};