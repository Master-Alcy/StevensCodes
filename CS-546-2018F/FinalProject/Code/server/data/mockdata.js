const mock = require('mockjs');
const uuid = require('uuid');
const bcrypt = require("bcrypt");
const Random = mock.Random;

const model = require('./models');
const User = model.getModel("User");
const Book = model.getModel("Book");

async function createUser(num) {
    var ids = {
        staffid: [],
        studentid: []
    };
    for (let i = 0; i < num; i++) {
        identity = Random.pick(["student", "staff"]);
        id = uuid.v4();
        if (identity === "student") {
            ids.studentid.push(id);
        } else {
            ids.staffid.push(id);
        }

        // Tell tester the name and password
        let aName = Random.word(4, 10);
        let aPass = Random.word(8, 16);
        console.log({
            username: aName,
            password: aPass
        });

        let user = {
            _id: id,
            sessionId: uuid.v4(),
            username: aName,
            hashedPassword: bcrypt.hashSync(aPass, 10),
            identity: identity,
            profile: {
                name: Random.word(3, 10),
                gender: Random.pick(["male", "female"]),
                email: mock.mock('@EMAIL()'),
                phone: Random.pick(['13531544954', '13632250649', '15820292420', '15999905612']),
                avatar: undefined
            },
            record: []
        }
        const userModel = new User(user);
        await userModel.save();
    }
    return ids;
}

async function createBook(num) {
    var bookids = [];
    for (let i = 0; i < num; i++) {
        let storage = Random.integer(1 + i, 10 + i);
        let id = uuid.v4();
        bookids.push(id);

        // Tell tester the name and password
        let aTitle = Random.word(3, 10);
        let aISBN = uuid.v4();
        console.log({
            title: aTitle,
            ISBN: aISBN
        });

        let book = {
            _id: id,
            title: aTitle,
            edition: Random.integer(1, 10),
            storage: storage - 1,
            totalStorage: storage,
            location: Random.word(3, 10),
            price: Random.integer(10, 500),
            ISBN: aISBN,
            profile: {
                author: Random.word(3, 10),
                description: Random.paragraph(3),
                tag: [Random.pick(["nodejs", "react", "web"], 2)],
            },
            record: []
        }
        const bookModel = Book(book);
        await bookModel.save();
    }
    return bookids;
}

async function createRecord(userids, bookids) {
    const studentid = userids.studentid;
    const staffid = userids.staffid;

    for (let i = 0; i < bookids.length; i++) {
        let book_id = bookids[i];
        let id1 = Random.pick(staffid);
        let id2 = Random.pick(studentid);
        let cid = uuid.v4();
        let date = Random.date();
        await User.updateOne({
            _id: id2
        }, {
            '$addToSet': {
                record: {
                    _id: cid,
                    bookid: book_id,
                    time: date,
                    action: "borrow",
                    staffid: id1,
                }
            }
        })
        await Book.updateOne({
            _id: book_id
        }, {
            '$addToSet': {
                record: {
                    _id: cid,
                    studentid: id2,
                    action: "rent",
                    time: date,
                    staffid: id1,
                }
            }
        })
    }
}

async function createMockData(num) {
    let ids = await createUser(num)
    let bookids = await createBook(num)
    await createRecord(ids, bookids)
    console.log("Done");
}

createMockData(10);