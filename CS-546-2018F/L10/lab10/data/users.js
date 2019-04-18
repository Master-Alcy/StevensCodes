"use strict";
const uuidv1 = require("uuid/v1");

const users = [
    {
        _id: uuidv1(),
        username: "masterdetective123",
        FirstName: "Sherlock",
        LastName: "Holmes",
        Profession: "Detective",
        Bio: "Sherlock Holmes (/ˈʃɜːrlɒk ˈhoʊmz/) is a fictional private detective created by British author Sir Arthur Conan Doyle. Known as a \"consulting detective\" in the stories, Holmes is known for a proficiency with observation, forensic science, and logical reasoning that borders on the fantastic, which he employs when investigating cases for a wide variety ofclients, including Scotland Yard.",
        Password: "elementarymydearwatson",
        HashedPassword: "$2a$16$7JKSiEmoP3GNDSalogqgPu0sUbwder7CAN/5wnvCWe6xCKAKwlTD."
    },
    {
        _id: uuidv1(),
        username: "lemon",
        FirstName: "Elizabeth",
        LastName: "Lemon",
        Profession: "Writer",
        Bio: "Elizabeth Miervaldis \"Liz\" Lemon is the main character of the American television series 30 Rock. She created and writes for the fictional comedy-sketch show The Girlie Show or TGS with Tracy Jordan.",
        Password: "damnyoujackdonaghy",
        HashedPassword: "$2a$16$SsR2TGPD24nfBpyRlBzINeGU61AH0Yo/CbgfOlU1ajpjnPuiQaiDm"
    },
    {
        _id: uuidv1(),
        username: "theboywholived",
        FirstName: "Harry",
        LastName: "Potter",
        Profession: "Student",
        Bio: "Harry Potter is a series of fantasy novels written by British author J. K. Rowling. The novels chronicle thelife of a young wizard, Harry Potter, and his friends Hermione Granger and Ron Weasley, all of whom are students at Hogwarts School of Witchcraft and Wizardry . The main story arc concerns Harry's struggle against Lord Voldemort, a dark wizard who intendsto become immortal, overthrow the wizard governing body known as the Ministry of Magic, and subjugate all wizards and Muggles.",
        Password: "quidditch",
        HashedPassword: "$2a$16$4o0WWtrq.ZefEmEbijNCGukCezqWTqz1VWlPm/xnaLM8d3WlS5pnK"
    }
];

async function getPostByName(name) {
    const usersCollection = users;
    let post = undefined;
    for (let i = 0; i < usersCollection.length; i++) {
        if (usersCollection[i].username === name){
            post = usersCollection[i];
        }
    }
    if (post) {
        return post;
    }else{
        return undefined;
    }
}

module.exports = {
    getPostByName
};