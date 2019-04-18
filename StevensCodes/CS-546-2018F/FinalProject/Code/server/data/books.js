const models = require('./models');
const bookModel = models.getModel('Book');
const uuid = require('uuid');
//测试用
async function getAllBooks(){
    let result = await bookModel.find({});
    if(result && result.length > 0){
        return {success: true, data: result};
    }
    else{
        return {success: false, desc: `can't find any book.`};
    }
}

async function getBookById(id) {
    if(typeof id !== 'string'){
        return {success: false, desc: "invalid params"};
    }
    let result = await bookModel.findOne({_id: id});
    if(result){
        return {success: true, data: result};
    }else{
        return { success : false, desc: `can't find ${id} in database`}
    }
}

async function getBooksByISBN(ISBN){
    if(typeof ISBN !== 'string'){
        return {success: false, desc: "invalid params"};
    }
    let result = await bookModel.findOne({'ISBN': ISBN});
    if(result){
        return {success: true, data: result};
    }
    else{
        return { success : false, desc: `can't find ${ISBN} in database`}
    }
}

async function getBookIdByTitle(title){
    if(typeof title !== 'string'){
        return {success: false, desc: "invalid params"};
    }
    let result = await bookModel.find({"title": title});
    if(result.length > 0){
        return {success: true, data: result};
    }
    else{
        return {success: false, desc: `can't find matched item with ${title} in database`};
    }
}

//要求传入所有的profile信息
async function updateBookProfileById(id, profile) {
    if(typeof id !== 'string'){
        return {success: false, desc: "invalid params"};
    }
    let result = await bookModel.updateOne({_id: id},{"$set":{
        'profile':{
            'author': profile.author,
            'description': profile.description,
            'tag': profile.tag
        }
    }})
    if(result.n > 0){
        return { success : true , data : result.nModified}
    }else{
        return { success : false, desc: `can't find ${id} in database`}
    }
}

//action为storage变化的数量
async function changeStorageById(id, action){
    if(typeof id !== 'string' || typeof action !== 'number'){
        return {success: false, desc: "invalid params"};
    }
    let result = await bookModel.updateOne({'_id': id},{"$inc":{
        "storage": action
    }})
    if(result.n > 0){
        let data = await getBookById(id);
        return {success: true, data: data};
    }
    else{
        return {success: false, desc: `can't find matched item with ${id} in database`}
    }
}

async function changeTotalStorageById(id, action){
    if(typeof id !== 'string' || typeof action !== 'number'){
        return {success: false, desc: "invalid params"};
    }
    let result = await bookModel.updateOne({'_id': id},{"$inc":{
        "totalStorage": action
    }})
    if(result.n > 0){
        let data = await getBookById(id);
        return {success: true, data: data};
    }
    else{
        return {success: false, desc: `can't find matched item with ${id} in database`}
    }
}

async function addBook(data){
    if(data === undefined){
        return {success: false, desc: "No book received at server."}
    }
    let ISBN = data.ISBN
    if(ISBN === undefined){
        return {success: false, desc: "No ISBN received at server."}
    }
    let info = await getBooksByISBN(ISBN); 
    //ISBN已存在
    if (info.success) {
        return {success: false, desc: "Book already exist. Use book update."}
    }
    // if(info.success === true){
    //     let id = info.data._id;
    //     //现有量和总量加action
    //     let storageInfo = await changeStorageById(id, data.storage);
        
    //     let totalStorageInfo = await changeTotalStorageById(id, data.totalStorage);
    //     if(storageInfo.success && totalStorageInfo.success){
    //         let data = await getBookById(id);
    //         return {success: true, data: data};
    //     }
    //     if(storageInfo.success === false)
    //     {
    //         return {success: false, desc: storageInfo.desc};
    //     }
    //     if(totalStorageInfo.success === false)
    //     {
    //         return {success: false, desc: totalStorageInfo.desc};
    //     }
    // }
    //ISBN不存在，初始化现有存储量和总量 
    else{
        let new_book = await new bookModel({
            "_id": uuid.v4(),
            "title": data.title,
            "edition": data.edition,
            "storage": data.storage,
            "totalStorage": data.totalStorage,
            "location": data.location,
            "price": data.price,
            "ISBN": data.ISBN,
            "profile": data.profile,
            "record": data.record
        });
        
        try{
            await new_book.save()
            return {success: true, data: new_book}
        }catch(err){
            return {success: false, desc: err}
        }
    }
}

async function addRecordById(id, data){
    if(typeof id !== 'string'){
        return {success: false, desc: "invalid params"};
    }
    let newRecordId = uuid.v4()
    let result = await bookModel.updateOne({_id: id},{"$addToSet":{
        "record":{
            "_id": newRecordId,
            "studentid": data.studentid,
            "action": data.action,
            "time": data.time,
            "staffid": data.staffid
        }
    }})
    if(result.n > 0){
        return { success : true , data : await getRecordByRecordId(newRecordId)}
    }else{
        return { success : false, desc: `can't find ${id} in database`}
    }
}

async function getRecordByRecordId(id){
    if(typeof id !== 'string'){
        return { success : false, desc: "invalid params"}
    }
     
    let result = await bookModel.findOne({'record._id':id})
    if( result ){
        let data;
        result.record.forEach(element => {
            if(element._id == id){
                data =  element
            }
        });
        return { success : true, data: data}
    }else{
        return { success : false, desc: `can't find ${id} in database`}
    }

}

async function fuzzySearch(keyword){
    if(typeof keyword !== 'string'){
        return {success: false, desc:  "invalid params"};
    }
    let reg = new RegExp(keyword, 'i');
    let result = await bookModel.find({
        $or: [
            {"title": {$regex: reg}},
            {"location": {$regex: reg}},
            {"profile.author": {$regex: reg}},
            {"profile.description": {$regex: reg}}
        ]
    });

    if(result.length > 0){
        return {success: true, data: result};
    }else{
        return {success: false, desc: `can't find any book with ${keyword}`};
    }
}

module.exports = {
    getAllBooks,
    getBookById,
    changeStorageById,
    changeTotalStorageById,
    getBookIdByTitle,
    getBooksByISBN,
    addBook,
    updateBookProfileById,
    addRecordById,
    getRecordByRecordId,
    fuzzySearch
}