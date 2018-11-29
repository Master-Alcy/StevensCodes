"use strict";
const uuid = require('uuid')
const models = require('./models')
const bookModel = models.getModel('Book')
const userModel = models.getModel('User')

async function getUserById(id){
    if(typeof id !== 'string'){
        return { success : false, desc: "invalid params"}
    }
    let result =  await userModel.findOne({_id:id})
    if( result ){
        return { success : true, data: result}
    }else{
        return { success : false, desc: `can't find ${id} in database`}
    }
}

async function getUserByUsername(username){
    if(typeof username !== 'string'){
        return { success : false, desc: "invalid params"}
    }
    let result =  await userModel.findOne({'username':username})
    if( result ){
        return { success : true, data: result}
    }else{
        return { success : false, desc: `can't find ${username} in database`}
    }
}

async function getUserBySessionId(sessionid){
    if(typeof sessionid !== 'string'){
        return { success : false, desc: "invalid params"}
    }
    let result = await userModel.findOne({'sessionId':sessionid})
    if( result ){
        return { success : true, data: result}
    }else{
        return { success : false, desc: `can't find ${sessionid} in database`}
    }
}

async function deleteSessionId(sessionid){
    if(typeof sessionid !== 'string'){
        return { success : false, desc: "invalid params"}
    }
    let result = await userModel.updateOne({'sessionId':sessionid},{'$set':{
        'sessionId': undefined
    }})

    if(result.n > 0){
        return { success : true , data : result.nModified}
    }else{
        return { success : false, desc: `can't find ${sessionid} in database`}
    }
}

async function addSessionIdById(id){
    if(typeof id !== 'string'){
        return { success : false, desc: "invalid params"}
    }
    let newSessionId = uuid.v4()
    let result =  await userModel.updateOne({'_id':id},{'$set':{
        'sessionId': newSessionId
    }})
    if(result.n > 0){
        return { success : true , data : newSessionId}
    }else{
        return { success : false, desc: `can't find ${id} in database`}
    }
}

// 需要附带原来profile中的数据
async function updateUserProfilebyId(id, profile){
    if(typeof id !== 'string'){
        return { success : false, desc: "invalid params"}
    }
    let result = await userModel.updateOne({'_id':id},{'$set':{
        'profile':{
            'name' : profile.name,
            'gender' : profile.gender,
            'email' : profile.email,
            'phone' : profile.phone,
            'avatar' : profile.avatar
        }
    }})
    if(result.n > 0){
        return { success : true , data : result.nModified}
    }else{
        return { success : false, desc: `can't find ${id} in database`}
    }
}

async function addUser(data){
    let result = await new userModel({
        '_id': uuid.v4(),
        'sessionId' : uuid.v4(),
        'username' : data.username,
        'hashedPassword' :data.hashedPassword,
        'identity' : data.identity,
    })
    if(result){
        return { success : true , data : result}
    }else{
        return { success : false}
    }
}

async function updateHashedPasswordById(id, hashedPassword){
    if(typeof id !== 'string'){
        return { success : false, desc: "invalid params"}
    }
    let result = await userModel.updateOne({'_id':id},{'$set':{
        'hashedPassword':hashedPassword
    }})
    if(result.n > 0){
        return { success : true , data : result.nModified}
    }else{
        return { success : false, desc: `can't find ${id} in database`}
    }
}

async function addRecordById(id, data){
    if(typeof id !== 'string'){
        return { success : false, desc: "invalid params"}
    }
    let newRecordId = uuid.v4()
    let result = await userModel.updateOne({'_id':id},{'$addToSet':{
        'record':{
            '_id' : newRecordId,
            'bookid' : data.bookid,
            'time' : data.time,
            'action' : data.action,
            'staffid' : data.staffid,
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
     
    let result = await userModel.findOne({'record._id':id})
    
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

module.exports = {
    getUserById,
    getUserByUsername,
    getUserBySessionId,
    deleteSessionId,
    addSessionIdById,
    updateUserProfilebyId,
    addUser,
    updateHashedPasswordById,
    addRecordById,
    getRecordByRecordId
}