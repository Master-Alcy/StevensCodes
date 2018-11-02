async function loopOverChar (text, obj) {
    if (!text || !obj) { throw `No text or object was provided`;}
    try {
        const arrChar = text.split('');
        let totalLetters = 0;
        let totalVowels = 0;
        for (let i = 0; i < arrChar.length; i++){
            let thisChar = arrChar[i];
            if (/[a-z]/.test(thisChar)){
                totalLetters ++;
                if (/[aeiou]/.test(thisChar)){
                    totalVowels ++;
                }
            }
        }
        obj['totalLetters'] = totalLetters;
        obj['totalNonLetters'] = arrChar.length - totalLetters;
        obj['totalVowels'] = totalVowels;
        obj['totalConsonants'] = totalLetters - totalVowels;
        return obj;
    }catch (e){
        throw `Error in loopOverChar: \n${e}`;
    }
}

async function loopOverWord (text, obj) {
    if (!text || !obj) { throw `No text or object was provided`;}
    try {
        text = text.replace(/([^a-z])+/gmi, ' ').replace('/\\s+/', ' ');
        const arrWord = text.split(' ').filter(x => x);
        const uniqueWords = [...new Set(arrWord)];
        let longWords = 0;
        let averageWordLength = 0;
        let wordOccurrences = {};
        for (let i = 0; i < arrWord.length; i++) {
            let thisWord = arrWord[i];
            if (thisWord.length >= 6){
                longWords ++;
            }
            averageWordLength += thisWord.length;
            if (!wordOccurrences[thisWord]){
                wordOccurrences[thisWord] = 0;
            }
            wordOccurrences[thisWord] ++;
        }
        obj['totalWords'] = arrWord.length;
        obj['uniqueWords'] = uniqueWords.length;
        obj['longWords'] = longWords;
        obj['averageWordLength'] = averageWordLength/(arrWord.length);
        obj['wordOccurrences'] = wordOccurrences;
        return obj;
    }catch(e){
        throw `Error in loopOverWord: \n${e}`;
    }
}

function createMetrics(text) {
    let obj = {};
    text = text.toLowerCase();
    try {
        loopOverChar(text ,obj);
        loopOverWord(text ,obj);
        return obj;
    }catch(e){
        throw `Error in loop functions: \n${e}`;
    }
}

module.exports = {
    createMetrics
}