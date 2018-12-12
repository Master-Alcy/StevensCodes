# Library System Database Proposal

*  Shuangwei Shi
*  Jingxuan Ai
*  Ziang Lin
*  Ying Lu
*  Guanqin Zeng
*  Mingze Zhu

## Users

The user collection will store all users and their profiles. Users will be able to login, and update their profile.

```
{
    "_id":"7b7997a2-c0d2-4f8c-b27a-6a1d4b5b6310",
    "sessionId":"b3988882-627f-4c59-8d5d-54b7a43b030e",
    "username": "masterGroup",
    "hashedPassword":"$2a$08$XdvNkfdNIL8Fq7l8xsuIUeSbNOFgK0M0iV5HOskfVn7",
    "identity": "student",
    "profile":{       
        "name":"Guanqin Zeng",
        "gender":"male",
        "email":"agoodemail@amail.com",
        "phone":"347-123-1234",
        "avatar":"/imag/masterGroup.png"
    },
    "record":[
        {
            "_id":"7b7997a2-abcd-4f8c-b27a-6a1d4b5b6310",
            "bookid":"21123123-abcd-4f8c-b27a-6a1d4b5b6310",
            "time":"EST-2018-11-22-23-59-59",
            "action":"borrow"
            "staffid":"7b7997a2-abcd-efgh-b27a-6a1d4b5b6310"
        },
        {
            "_id":"7b7997a222-abcd-4f8c-b27a-6a1d4b5b6310",
            "bookid":"2112223123-abcd-4f8c-b27a-6a1d4b5b6310",
            "time":"EST-2018-11-22-23-59-58",
            "action":"rent",
            "staffid":"7b7997a2-abcd-efgh-b27a-6a1d4b5b6310"
        }
    ]
}
```

| Name           | Type         | Description                                                  |
| -------------- | ------------ | ------------------------------------------------------------ |
| _id            | string       | A globally unique identifier to represent the user           |
| sessionid      | string       | A globally unique identifier to represent the user's current session |
| username       | string       | User's login name                                            |
| hashedpassword | string       | A hashed version of the user's password                      |
| identity       | String       | Student or staff                                             |
| profile        | User Profile | User's profile                                               |
| record         | User Record  | User's records                                               |

## User Profile (subdocument)

This subdocument is used to describe the user's profile. These are the information can be changed by the user.

```
{
    "name":"Guanqin Zeng",
    "gender":"male",
    "email":"agoodemail@amail.com",
    "phone":"347-123-1234",
    "avatar":"/imag/masterGroup.png"
}
```

| Name   | Type   | Description                       |
| ------ | ------ | --------------------------------- |
| name   | string | User's real name                  |
| gender | string | As it is                          |
| email  | string | As it is                          |
| phone  | string | As it is                          |
| avatar | string | A link to the place avatar stored |

## User Record (subdocument)

This subdocument is used to describe the user's records, stored as a list. Student can check the record but can't change it. Staff should be able to change this.

```
[
    {
        "_id":"7b7997a2-abcd-4f8c-b27a-6a1d4b5b6310",
        "bookid":"21123123-abcd-4f8c-b27a-6a1d4b5b6310",
        "time":"EST-2018-11-22-23-59-59",
        "action":"borrow",
        "staffid":"7b7997a2-abcd-efgh-b27a-6a1d4b5b6310"
    },
    {
        "_id":"7b7997a222-abcd-4f8c-b27a-6a1d4b5b6310",
        "bookid":"2112223123-abcd-4f8c-b27a-6a1d4b5b6310",
        "time":"EST-2018-11-22-23-59-58",
        "action":"return",
        "staffid":"7b7997a2-abcd-efgh-b27a-6a1d4b5b6310"
    }
]
```

| Name       | Type   | Description                        |
| ---------- | ------ | ---------------------------------- |
| _id        | string | Globally unique id for this action |
| bookid     | string | As it is                           |
| time       | string | The time this action was taken     |
| action     | string | Borrow or return                   |
| staffid    | string | Operated by staff                  |

## Book

The book collection will store all books and their records. Staff can add, update, and delete this collection.

```
{
    "_id":"7b7997a2-c0d2-4f8c-b27a-6a1d4b5b6310",
    "title": "ABook",
    "edition": 4,
    "storage": 9,
    "totalStorage": 20,
    "location": "Library 2nd floor 2B-5-20",
    "price": 20.98,
    "ISBN": "978-0-321-57351-3",
    "profile":{
        "Author": "Someone",
        "description":"This is a book",
        "tag": "Tech"
    },
    "record":[
        {
            "_id":"7b7997a2-abcd-4f8c-b27a-6a1d4b5b6310",
            "studentid":"21123123-abcd-4f8c-b27a-6a1d4b5b6310",
            "action":"borrow",
            "time":"EST-2018-11-22-23-59-59",
            "staffid":"7b7997a2-abcd-efgh-b27a-6a1d4b5b6310"
        },
        {
            "_id":"7b7997a2-abcd-4f8c-b27a-6a1d4b5b6310",
            "studentid":"21123123-abcd-4f8c-b27a-6a1d4b5b6310",
            "action":"return",
            "time":"EST-2018-11-22-23-59-59",
            "staffid":"7b7997a2-abcd-efgh-b27a-6a1d4b5b6310"
        }
    ]
}
```

| Name         | Type         | Description                                    |
| ------------ | ------------ | ---------------------------------------------- |
| _id          | string       | Globally unique id for this book               |
| title        | string       | As it is                                       |
| edition      | int          | Book edition                                   |
| storage      | int          | Number of books avaliable for action           |
| totalStorage | int          | Not all book stored in library.                |
| location     | String       | Avaliable book's location in library           |
| Price        | Float        | As it is                                       |
| ISBN         | string       | As it is                                       |
| profile      | book profile | Description for this book                      |
| record       | book record  | Record for this book (Could be 100 same books) |

## Book Profile (subdocument)

This subdocument is used to describe the book's profile.

```
{
    "Author": "Someone",
    "description":"This is a book",
    "tag": "Tech"
}
```

| Name        | Type   | Description                       |
| ----------- | ------ | --------------------------------- |
| Author      | string | As it is                          |
| description | string | What this book is about           |
| tag         | Array | For search and placement easiness |

## Book Record (subdocument)

This subdocument is used to describe the book's records.

```
[
    {
        "_id":"7b7997a2-abcd-4f8c-b27a-6a1d4b5b6310",
        "studentid":"21123123-abcd-4f8c-b27a-6a1d4b5b6310",
        "action":"borrow",
        "time":"EST-2018-11-22-23-59-59",
        "staffid":"7b7997a2-abcd-efgh-b27a-6a1d4b5b6310"
    },
    {
        "_id":"7b7997a2-abcd-4f8c-b27a-6a1d4b5b6310",
        "studentid":"21123123-abcd-4f8c-b27a-6a1d4b5b6310",
        "action":"return",
        "time":"EST-2018-11-22-23-59-59",
        "staffid":"7b7997a2-abcd-efgh-b27a-6a1d4b5b6310"
    }
]
```

| Name      | Type   | Description                        |
| --------- | ------ | ---------------------------------- |
| _id       | String | Globally unique id for this action |
| studentid | String | Who requred this action            |
| action    | String | borrow/return                      | 
| time      | string | Time this action performed         |
| staffid   | String | Who operated this action           |
