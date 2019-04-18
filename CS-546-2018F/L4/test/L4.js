console.log("Closure study");

function f1() {
    var n = 111;
    function f2() {
        console.log(n);
    }
}

/*
在上面的代码中，函数f2就被包括在函数f1内部，这时f1内部的所有局部变量，对f2都是可见的。
但是反过来就不行，f2内部的局部变量，对f1就是不可见的。这就是Javascript语言特有的
"链式作用域"结构（chain scope），子对象会一级一级地向上寻找所有父对象的变量。
所以，父对象的所有变量，对子对象都是可见的，反之则不成立。

既然f2可以读取f1中的局部变量，那么只要把f2作为返回值，我们不就可以在f1外部读取它的内部变量了吗！
*/
function f2() {
    var n = 222;
    function f3() {
        console.log(n);
    }
    return f3;
}
var result = f2();
result();

function f22() {
    return (n) => {
        console.log(n);
    }
}
f22()(333);

(() => {
    return (n) => {
        console.log(n);
    }
})()(444);

/*闭包就是能够读取其他函数内部变量的函数
由于在Javascript语言中，只有函数内部的子函数才能读取局部变量，
因此可以把闭包简单理解成"定义在一个函数内部的函数"。
所以，在本质上，闭包就是将函数内部和函数外部连接起来的一座桥梁。

闭包可以用在许多地方。它的最大用处有两个，一个是前面提到的可以读取函数内部的变量，
另一个就是让这些变量的值始终保持在内存中
*/
function f3() {
    var n = 999;
    nAdd = function () { n += 1 }
    function f4() {
        console.log(n);
    }
    return f4;
}

var result = f3();
result(); // 999
nAdd();
result(); // 1000
/*
在这段代码中，result实际上就是闭包f4函数。它一共运行了两次，第一次的值是999，第二次的值是1000。
这证明了，函数f3中的局部变量n一直保存在内存中，并没有在f3调用后被自动清除。

为什么会这样呢？原因就在于f3是f4的父函数，而f4被赋给了一个全局变量，这导致f4始终在内存中，
而f3的存在依赖于f3，因此f3也始终在内存中，不会在调用结束后，被垃圾回收机制（garbage collection）回收。

这段代码中另一个值得注意的地方，就是"nAdd=function(){n+=1}"这一行，
首先在nAdd前面没有使用var关键字，因此nAdd是一个全局变量，而不是局部变量。
其次，nAdd的值是一个匿名函数（anonymous function），而这个匿名函数本身也是一个闭包，
所以nAdd相当于是一个setter，可以在函数外部对函数内部的局部变量进行操作。
*/
//闭包内存消耗大，程序完结应删除不用的局部变量
//闭包会在父函数外部，改变父函数内部变量的值。
console.log("-------------------------------------\n\n");

/*You use connection information in order to connect to the database
You store this database connection in a variable and use it to access collections
You store this collection reference in a variable and use it to 
access collection operations */

//----------Connection to database ----------------
//mongoConnection.js
const MongoClient = require("mongodb").MongoClient;
const settings = require("./settings")
const mongoConfig = settings.mongoConfig;
/* 'settings' file:
{
  "mongoConfig": {
    "serverUrl": "mongodb://localhost:27017/",
    "database": "dogsWithBlogs"
  }
}*/
let _connection = undefined;
let _db = undefined;

//async () => {} this function would be called with ()
module.exports = async () => {
    if (!_connection) {
        //connect to the online address stored in settings
        _connection = await MongoClient.connect(mongoConfig.serverUrl);
        //use the database name stored in settings to get to the database
        _db = await _connection.db(mongoConfig.database);
    }
    //database, use this to access collections later on
    return _db;
};

//------------get to collection from connection--------------
//mongoCollections.js
const dbConnection = require("./mongoConnection");
/* This will allow you to have one reference to each collection per app */
/* Feel free to copy and paste this this */

//function getCollectionFn (collection){ ...}
const getCollectionFn = collection => {
    let _col = undefined; //collection variable
    //same as return async function abc () { ...}
    return async () => {
        //!x exclude the case when x = undefined
        if (!_col) {
            const db = await dbConnection();
            _col = await db.collection(collection);
            //use this to access collection operations
        }
        return _col;
    };
};
/* Now, you can list your collections here: */
module.exports = {
    //name: function(parameter_)
    posts: getCollectionFn("posts"),
    dogs: getCollectionFn("dogs")
};

//-------------operate collection----------------------
//dogs.js
const mongoCollections = require("./mongoCollections");
const dogs = mongoCollections.dogs;

module.exports = {
    // This is a fun new syntax that was brought forth in ES6, where we can define
    // methods on an object with this shorthand!
    //module.exports followed by a JSON object. So the naming of functions follows
    abc: async function () {},
    //const getCollectionFn = collection => {
    a: b => {},
    aa: function bb () {},

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
    async removeDog(id) {
        if (!id) throw "You must provide an id to search for";

        const dogCollection = await dogs();
        const deletionInfo = await dogCollection.removeOne({ _id: id });

        if (deletionInfo.deletedCount === 0) {
            throw `Could not delete dog with id of ${id}`;
        }
    },
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