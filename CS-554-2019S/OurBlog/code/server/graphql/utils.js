const jwt = require('jsonwebtoken');
const APP_SECRET = 'Group8-Project';

function getUserId(context) {
    const Authorization = context.request.get('Authorization');
    if (Authorization) {
        const token = Authorization.replace('Bearer ', '');
        const { userId } = jwt.verify(token, APP_SECRET);
        return userId;
    }
    throw new Error('Not authenticated by JWT');
}

module.exports = {
    APP_SECRET,
    getUserId,
}