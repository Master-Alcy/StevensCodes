# The Best ToDo List in the World

* Phil Barresi
* Jacqueline Sharpe
* Francis Underwood
* Heather Dunbar
* Douglas Stamper
* Seth Grayson

## Users

The user collection will store all users and their profiles. Users will be able to login, update their profile, and post tasks.

```
{
    "_id":"7b7997a2-c0d2-4f8c-b27a-6a1d4b5b6310",
    "sessionId":"b3988882-627f-4c59-8d5d-54b7a43b030e",
    "hashedPassword":"$2a$08$XdvNkfdNIL8Fq7l8xsuIUeSbNOFgK0M0iV5HOskfVn7.PWncShU.O",
    "profile":{
        "name":"Phil Barresi",
        "hobby":"Coffee related tasks",
        "_id":"7b7997a2-c0d2-4f8c-b27a-6a1d4b5b6310"
    }
}
```

| Name | Type | Description |
|------|------|-------------|
| _id  | string | A globally unique identifier to represent the user |
| sessionId | string | A globally unique identifier to represent the user's current session |
| hashedPassword | string | A bcrypted string that is a hashed version of the user's password |
| profile | User Profile | The user's profile | 

## User Profile (subdocument; not stored in a collection)

This subdocument is used to describe the user's profile.

```
{
    "name":"Francis Underwood",
    "hobby":"Arguably hostile takeovers of democracy. Also, consumption of ribs.",
    "_id":"c5d0fd67-7977-4fc5-9088-33d0347c932b"
}
```

| Name | Type | Description |
|------|------|-------------|
| name | string | The user's name. | 
| hobby | string | A line of text that represents the user's hobby. |
| _id  | string | A globally unique identifier to represent the user |

## Tasks

The task collection will store all the tasks that are created.


```
{
    "_id":"5a5c4461-cdc9-4144-84f9-fcb278c5c122",
    "creator":{
        "name":"Francis Underwood",
        "hobby":"Arguably hostile takeovers of democracy. Also, consumption of ribs.",
        "_id":"c5d0fd67-7977-4fc5-9088-33d0347c932b"
    },
    "title":"Implement AmericaWorks",
    "description":"AmericaWorks is going to save America. Let's make Ameria Work and save ourselves from the current crises. Just have to hope that nothing bad happens, because this is a great idea. I love this idea. -FU",
    "comments":[
        {
            "_id":"d7a44a10-0de3-44ad-9c58-5f3fe8f1c0d3",
            "poster":{
                "name":"Phil Barresi",
                "hobby":"Coffee related tasks",
                "_id":"7b7997a2-c0d2-4f8c-b27a-6a1d4b5b6310"
            },
            "comment":"Frank... we spoke about this..."
        },
        {
            "_id":"d7a44a10-0de3-44ad-9c58-5f3fe8f1c0d3",
            "poster":{
                "name":"Francis Underwood",
                "hobby":"Arguably hostile takeovers of democracy. Also, consumption of ribs.",
                "_id":"c5d0fd67-7977-4fc5-9088-33d0347c932b"
            },
            "comment":"There can be no false steps now. The higher up the mountain the more treacherous the path."
        },
        {
            "_id":"d7a44a10-0de3-44ad-9c58-5f3fe8f1c0d3",
            "poster":{
                "name":"Phil Barresi",
                "hobby":"Coffee related tasks",
                "_id":"7b7997a2-c0d2-4f8c-b27a-6a1d4b5b6310"
            },
            "comment":"Okay, you know what? Do whatever you want Frank."
        }
    ]
}
```

| Name | Type | Description |
|------|------|-------------|
| _id | string | The task ID. | 
| creator | User Profile | A profile of the user whom has created the task.. |
|title| string | The task title |
|description| string | A longer description of the task |
|comments| comment array | An array of comments related to the thread |

## Comment (subdocument; not stored in a collection)

A single comment on a discussion.

```
{
    "_id":"d7a44a10-0de3-44ad-9c58-5f3fe8f1c0d3",
    "poster":{
        "name":"Phil Barresi",
        "hobby":"Coffee related tasks",
        "_id":"7b7997a2-c0d2-4f8c-b27a-6a1d4b5b6310"
    },
    "comment":"Okay, you know what? Do whatever you want Frank."
}
```

| Name | Type | Description |
|------|------|-------------|
| _id | string | The comment ID. | 
| poster | User Profile | A profile of the user who made the comment |
| comment | string | The comment that the user made |

