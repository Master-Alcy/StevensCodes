import firebase from 'firebase';

const config = {
   
};

firebase.initializeApp(config);
console.log("initialised")
export default firebase;
export const auth = firebase.auth();
