const mongoose = require('mongoose')
const config = require('./config')
const DB_URL = config.serverUrl + config.database

mongoose.connect(DB_URL, {
    useNewUrlParser: true 
}, (err) => {
    if (err) {
        console.warn('cannot connected to database! ' + err)
    } else {
        console.log('connected to datbase: ' + DB_URL)
    }
});

const userSchema =  mongoose.Schema({
    _id:{type : String, 'require':true},
    sessionId : String,
    username :{type:String, 'require':true},
    hashedPassword :{type:String, 'require':true},
    identity : {type:String, 'require':true},
    profile : {
        name : String,
        gender: String,
        email : String,
        phone : String,
        avatar : String
    },
    record: [{
        _id : {type:String, require:true},
        bookid : {type:String, require:true},
        time : {type:Date, require:true},
        action : {type:String, require:true},
        staffid : {type:String, require:true},
    }]
});

const bookSchema = new mongoose.Schema({
    _id:{type : String, 'require':true},
    title : {type:String, 'require':true},
    edition : {type: Number, 'require':true},
    storage : {type: Number, 'require':true},
    totalStorage:{type: Number, 'require':true},
    location : String,
    price: Number,
    ISBN: {type : String, 'require':true},
    profile : {
        author : String,
        description : String,
        tag : [{type:String}],
    },
    record: [{
        _id : {type:String, require:true},
        studentid : {type:String, require:true},
        action : {type:String, require:true},
        time : {type:Date, require:true},
        staffid : {type:String, require:true},
    }]
});

mongoose.model('User', userSchema);
mongoose.model('Book', bookSchema);

module.exports = {
    getModel:function(name){
        return mongoose.model(name)
    }
};