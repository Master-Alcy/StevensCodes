import firebase from 'firebase';

const config = {
    apiKey: "AIzaSyA_sTy2FDJnEEOXJLInfoKJH_MGJCAHpFM",
    authDomain: "ourblog-3b6f3.firebaseapp.com",
    databaseURL: "https://ourblog-3b6f3.firebaseio.com",
    projectId: "ourblog-3b6f3",
    storageBucket: "ourblog-3b6f3.appspot.com",
    messagingSenderId: "579554998450",
    appId: "1:579554998450:web:4bf806ebfa18cacc"
};

firebase.initializeApp(config);
console.log("initialised")
export default firebase;
export const auth = firebase.auth();
