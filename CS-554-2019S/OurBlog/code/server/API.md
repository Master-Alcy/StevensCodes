# API Document for Prisma-GraphQL Server

I attached string we need with responce format to make it easier for front-end to use the data.~~~~

## Index

- [API Document for Prisma-GraphQL Server](#api-document-for-prisma-graphql-server)
  - [Index](#index)
  - [1 - CREATE](#1---create)
    - [1.1 - signup](#11---signup)
    - [1.2 - login](#12---login)
    - [1.3 - post new blog](#13---post-new-blog)
    - [1.4 - post new comment](#14---post-new-comment)
    - [1.5 - post new tag](#15---post-new-tag)
  - [2 - READ](#2---read)
    - [2.1 - me](#21---me)
    - [2.2 - get all users](#22---get-all-users)
    - [2.3 - get all blogs](#23---get-all-blogs)
    - [2.4 - get all comments](#24---get-all-comments)
    - [2.5 - get all tags](#25---get-all-tags)
    - [2.6 - elastic search for blogs](#26---elastic-search-for-blogs)
    - [2.7 - other APIs](#27---other-apis)
  - [3 - UPDATE](#3---update)
    - [3.1 - update user](#31---update-user)
    - [3.2 - update blog](#32---update-blog)
    - [3.3 - update comment](#33---update-comment)
    - [3.4 - like blog](#34---like-blog)
    - [3.5 - like comment](#35---like-comment)
  - [4 - DELETE](#4---delete)
    - [4.1 - delete user](#41---delete-user)
    - [4.2 - delete blog](#42---delete-blog)
    - [4.3 - delete comment](#43---delete-comment)
    - [4.4 - delete tag](#44---delete-tag)

## 1 - CREATE

### 1.1 - signup

- Request:

~~~graphql
mutation {
  signup(
    name: "Alice"
    email: "alice@prisma.io"
    password: "graphql"
  ) {
    token
    user {
      id
    }
  }
}
~~~

- Responce:

~~~json
{
  "data": {
    "signup": {
      "token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOiI1Y2JiYjcxNDI0YWE5YTAwMDgyOWUyMDMiLCJpYXQiOjE1NTU4MDU5NzJ9.MKJgtWSESNaNvEbv_d2ZKaENkLKGTamrJN6H_wpOcjw",
      "user": {
        "id": "5cbbb71424aa9a000829e203"
      }
    }
  }
}
~~~

### 1.2 - login

- Request:

~~~graphql
mutation {
  login(
    email: "admin@fake"
    password: "fake"
  ){
    token
    user {
      id
      name
    }
  }
}
~~~

- Responce:

~~~json
{
  "data": {
    "login": {
      "token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOiI1Y2QzMmJjNTAyNzQzOTAwMDcyMTQzM2UiLCJpYXQiOjE1NTczNDY1MjF9.K6i_SqEj5tHXaDzXsGF0x00qBBPOz9_tHjv4qY7rDRw",
      "user": {
        "id": "5cd32bc5027439000721433e",
        "name": "admin"
      }
    }
  }
}
~~~

### 1.3 - post new blog

- From the server’s response, copy the authentication token and open another tab in the Playground. Inside that new tab, open the HTTP HEADERS pane in the bottom-left corner and specify the Authorization header - similar to what you did with the Prisma Playground before. Replace the __TOKEN__ placeholder in the following snippet with the copied token
- In Short: Copy the token you get back. Create the following header in HTTP Header, and replace the __TOKEN__ filed with the token you copied.

~~~json
{
  "Authorization": "Bearer __TOKEN__"
}
~~~

- Request:

~~~graphql
mutation {
  post(
    title: "newBlog"
    article: "something"
  ) {
    id
    createdAt
    updatedAt
    title
    article
    postedBy {
      name
    }
    comments {
      content
    }
  }
}
~~~

- Responce:

~~~json
{
  "data": {
    "postBlog": {
      "id": "5cd339640274390007214342",
      "createdAt": "2019-05-08T20:17:40.294Z",
      "updatedAt": "2019-05-08T20:17:40.294Z",
      "title": "newBlog",
      "article": "something",
      "postedBy": {
        "name": "admin"
      },
      "comments": []
    }
  }
}
~~~

### 1.4 - post new comment

~~~json
{
  "Authorization": "Bearer __TOKEN__"
}
~~~

- Request:

~~~graphql
mutation {
  postComment(
    content: "test, test, test"
    blogId: "5cd32e7b027439000721433f"
  ) {
    id
    content
    postedBy {
      name
    }
    forBlog {
      title
    }
  }
}
~~~

- Responce:

~~~json
{
  "data": {
    "postComment": {
      "id": "5cd33ac50274390007214343",
      "content": "test, test, test",
      "postedBy": {
        "name": "admin"
      },
      "forBlog": {
        "title": "newBlog"
      }
    }
  }
}
~~~

### 1.5 - post new tag

~~~json
{
  "Authorization": "Bearer __TOKEN__"
}
~~~

- Request:

~~~graphql
mutation {
  postTag(
    tag: "aaa"
    blogId: "5cd386870274390007b2fed1"
  ) {
    tag
    postedBy {
      title
      tags {
        tag
      }
    }
  }
}
~~~

- Responce:

~~~json
{
  "data": {
    "postTag": {
      "tag": "aaa",
      "postedBy": {
        "title": "Gvkmpnewgv Mhyrfv Yrjit Fisfdylop",
        "tags": [
          {
            "tag": "inm"
          },
          {
            "tag": "xvi"
          },
          {
            "tag": "aaa"
          }
        ]
      }
    }
  }
}
~~~

## 2 - READ

### 2.1 - me

This is used to check which user is your current token stands for

~~~json
{
  "Authorization": "Bearer __TOKEN__"
}
~~~

- Request:

~~~graphql
query me {
  me{
    id
    name
    email
    password
  }
}
~~~

- Responce:

~~~json
{
  "data": {
    "me": {
      "id": "5cd32bc5027439000721433e",
      "name": "admin",
      "email": "admin@fake",
      "password": "$2a$10$OHZq8K7Bcr6G8MUdwFYlgOHQWMmEK52Ea2HkJ/CvHPuWKiNRjQIpy"
    }
  }
}
~~~

### 2.2 - get all users

- Request:

~~~graphql
query {
    allUsers{
    id
    name
    blogs {
      title
    }
    comments {
      content
    }
  }
}
~~~

- Responce:

~~~json
{
  "data": {
    "allUsers": [
      {
        "id": "5cd32bc5027439000721433e",
        "name": "admin",
        "blogs": [
          {
            "title": "newBlog"
          },
          {
            "title": "newBlog"
          }
        ],
        "comments": [
          {
            "content": "test, test, test"
          }
        ]
      }
    ]
  }
}
~~~

### 2.3 - get all blogs

- Request:

~~~graphql
query {
  allBlogs {
    id
    title
    createdAt
    updatedAt
    likes
    comments {
      content
    }
    postedBy {
      name
    }
    tags {
      tag
    }
  }
}
~~~

- Responce:

~~~json
{
  "data": {
    "allBlogs": [
      {
        "id": "5cd386870274390007b2fed1",
        "title": "Gvkmpnewgv Mhyrfv Yrjit Fisfdylop",
        "createdAt": "2019-05-09T01:46:47.882Z",
        "updatedAt": "2019-05-09T01:46:47.882Z",
        "likes": 3,
        "comments": [
          {
            "content": "Ujgmmjqo omfglfrs auwbh."
          },
          {
            "content": "Trqzmlydz haxiw giuvse cglepxnxwq zmddwdknck xqrgkx okyqoc biuolp wluvztl."
          },
          {
            "content": "Zwtxitxn yxvm mdmv tzxwhiq uqjf ibtopqup fpt."
          },
          {
            "content": "Fqneevgt fcnjhnbd cdqjqesnv vqrfp mouvvujt."
          }
        ],
        "postedBy": {
          "name": "admin"
        },
        "tags": [
          {
            "tag": "inm"
          },
          {
            "tag": "xvi"
          }
        ]
      },
      {
        "id": "5cd386880274390007b2fed8",
        "title": "Jacws Rqz",
        "createdAt": "2019-05-09T01:46:48.146Z",
        "updatedAt": "2019-05-09T01:46:48.146Z",
        "likes": 22,
        "comments": [
          {
            "content": "Iaizegre qettwdxu msorua fubdupmcms meueu yxeshwk aigvw toxvngk yyshwgw dhv twockn dxcswzsd."
          },
          {
            "content": "Djywqfvx vyyn vbvqcl peanksc wedo bmjwvc jqqdzrsu."
          },
          {
            "content": "Jxbwl kodtquw xwnudwp lwotjm mviuo."
          }
        ],
        "postedBy": {
          "name": "admin"
        },
        "tags": [
          {
            "tag": "tgvz"
          },
          {
            "tag": "yhqe"
          }
        ]
      }
    ]
  }
}
~~~

### 2.4 - get all comments

- Request:

~~~graphql
query {
  allComments {
    id
    createdAt
    updatedAt
    likes
    content
  }
}
~~~

- Responce:

~~~json
{
  "data": {
    "allComments": [
      {
        "id": "5cd33ac50274390007214343",
        "createdAt": "2019-05-08T20:23:33.112Z",
        "updatedAt": "2019-05-08T20:23:33.112Z",
        "likes": 0,
        "content": "test, test, test"
      }
    ]
  }
}
~~~

### 2.5 - get all tags

- Request:

~~~graphql
query {
  allTags {
    id
    tag
  }
}
~~~

- Responce:

~~~json
{
  "data": {
    "allTags": [
      {
        "id": "5cd386880274390007b2fed6",
        "tag": "inm"
      },
      {
        "id": "5cd386880274390007b2fed7",
        "tag": "xvi"
      },
      {
        "id": "5cd386880274390007b2fedc",
        "tag": "tgvz"
      },
      {
        "id": "5cd386880274390007b2fedd",
        "tag": "yhqe"
      }
    ]
  }
}
~~~

### 2.6 - elastic search for blogs

- Request:

~~~graphql
query {
  elasticSearch(
    searchString: "test"
  ) {
    id
    title
    text
  }
}
~~~

- Responce:

~~~json
{
  "data": {
    "elasticSearch": [
      {
        "id": "5cd34c3c0274390007214345",
        "title": "test for es",
        "text": "something sndkakd sajndkajs bdkjas jdka "
      }
    ]
  }
}
~~~

### 2.7 - other APIs

1. getUser(id: ID, email: String): User
2. getBlog(id: ID, title: String): Blog
3. getComment(id: ID!): Comment
4. getTag(id: ID, tag: String): Tag
5. filterBlogsByString(searchString: String): [Blog!]!
6. filterBlogsByLikes(minLikes: Int): [Blog!]!
7. filterCommentsByString(searchString: String): [Comment!]!
8. filterCommentsByLikes(minLikes: Int): [Comment!]!

## 3 - UPDATE

### 3.1 - update user

~~~json
{
  "Authorization": "Bearer __TOKEN__"
}
~~~

- Request:

~~~graphql
mutation {
  updateUser(
    interest: "SOmething"
    address: "123 4th st"
    name: "updated name"
    newEmail: "new@email"
    phone: "123456789"
  ) {
    id
    email
    name
    phone
    address
    interest
  }
}
~~~

- Responce:

~~~json
{
  "data": {
    "updateUser": {
      "id": "5cd32bc5027439000721433e",
      "email": "new@email",
      "name": "updated name",
      "phone": "123456789",
      "address": "123 4th st",
      "interest": "SOmething"
    }
  }
}
~~~

### 3.2 - update blog

~~~json
{
  "Authorization": "Bearer __TOKEN__"
}
~~~

- Request: You can use id or title for args

~~~graphql
mutation {
  updateBlog(
    id: "5cd32e7b027439000721433f"
    article: "updated"
  ) {
    title
    article
  }
}
~~~

- Responce:

~~~json
{
  "data": {
    "updateBlog": {
      "title": "newBlog",
      "article": "updated"
    }
  }
}
~~~

### 3.3 - update comment

~~~json
{
  "Authorization": "Bearer __TOKEN__"
}
~~~

- Request:

~~~graphql
mutation {
  updateComment(
    id: "5cd33ac50274390007214343"
    content: "changed"
    likes: 1
  ) {
    createdAt
    updatedAt
    content
    likes
    postedBy{
      name
    }
    forBlog {
      title
    }
  }
}
~~~

- Responce:

~~~json
{
  "data": {
    "updateComment": {
      "createdAt": "2019-05-08T20:23:33.112Z",
      "updatedAt": "2019-05-08T20:39:54.272Z",
      "content": "changed",
      "likes": 1,
      "postedBy": {
        "name": "updated name"
      },
      "forBlog": {
        "title": "newBlog"
      }
    }
  }
}
~~~

### 3.4 - like blog

- Request: You can use id or title for args

~~~graphql
mutation {
  likeBlog(
    id:"5cd32e7b027439000721433f"
  ) {
    title
    likes
  }
}
~~~

- Responce:

~~~json
{
  "data": {
    "likeBlog": {
      "title": "newBlog",
      "likes": 2
    }
  }
}
~~~

### 3.5 - like comment

- Request:

~~~graphql
mutation {
  likeComment(
    id: "5cd33fd80274390007214344"
  ) {
    content
    likes
  }
}
~~~

- Responce:

~~~json
{
  "data": {
    "likeComment": {
      "content": "test, test, test",
      "likes": 1
    }
  }
}
~~~

## 4 - DELETE

### 4.1 - delete user

~~~json
{
  "Authorization": "Bearer __TOKEN__"
}
~~~

- Request: You can use id or email for args

~~~graphql
mutation {
  deleteUser(
    id: "5cd32432027439000721433a"
  ) {
    name
    email
  }
}
~~~

- Responce:

~~~json
{
  "data": {
    "deleteUser": {
      "name": "somename",
      "email": "something"
    }
  }
}
~~~

### 4.2 - delete blog

~~~json
{
  "Authorization": "Bearer __TOKEN__"
}
~~~

- Request: You can use id or title for args

~~~graphql
mutation {
  deleteBlog(
    id:"5cd32f710274390007214341"
  ) {
    title
  }
}
~~~

- Responce:

~~~json
{
  "data": {
    "deleteBlog": {
      "id": "aaaaaaaaaaaaaaaa"
    }
  }
}
~~~

### 4.3 - delete comment

~~~json
{
  "Authorization": "Bearer __TOKEN__"
}
~~~

- Request:

~~~graphql
mutation {
  deleteComment(
    id: "5cd32e880274390007214340"
  ) {
    content
  }
}
~~~

- Responce:

~~~json
{
  "data": {
    "deleteComment": {
      "content": "some comtent"
    }
  }
}
~~~

### 4.4 - delete tag

~~~json
{
  "Authorization": "Bearer __TOKEN__"
}
~~~

- Request: You can use id or tag for args

~~~graphql
mutation deleteTag {
  deleteTag(
    tag: "aaa"
  ) {
    id
    tag
  }
}
~~~

- Responce:

~~~json
{
  "data": {
    "deleteTag": {
      "id": "5cd38a190274390007b2fede",
      "tag": "aaa"
    }
  }
}
~~~