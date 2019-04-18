function test (str) {
    if (!str) {
        throw "No text provided.";
    }
    if (typeof str !== "string") {
        throw "Not in valid type.";
    }
    str = str.replace(/([^a-z0-9])+/gmi, '').toLowerCase();
    let strRev = str.split('').reverse().join('');

    if (str === strRev) {
        return true;
    }
    return false;
}

module.exports = {test};