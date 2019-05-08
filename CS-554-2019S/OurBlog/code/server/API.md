# API Document for Prisma-GraphQL Server

I attached string we need with responce format to make it easier for front-end to use the data.~~~~

## Index

## 1 - CREATE

### 1.1 - signup

* Request:

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

* Responce:

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

* Request:

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

* Responce:

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

* From the server’s response, copy the authentication token and open another tab in the Playground. Inside that new tab, open the HTTP HEADERS pane in the bottom-left corner and specify the Authorization header - similar to what you did with the Prisma Playground before. Replace the __TOKEN__ placeholder in the following snippet with the copied token
* In Short: Copy the token you get back. Create the following header in HTTP Header, and replace the __TOKEN__ filed with the token you copied.

~~~json
{
  "Authorization": "Bearer __TOKEN__"
}
~~~

* Request:

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

* Responce:

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

### 1.4 post new comment

~~~json
{
  "Authorization": "Bearer __TOKEN__"
}
~~~

* Request:

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

* Responce:

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

## 2 - READ

### 2.1 - me

This is used to check which user is your current token stands for

~~~json
{
  "Authorization": "Bearer __TOKEN__"
}
~~~

* Request:

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

* Responce:

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

* Request:

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

* Responce:

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

* Request:

~~~graphql
query {
  allBlogs {
    id
    title
    article
    createdAt
    updatedAt
    likes
    comments {
      content
    }
  }
}
~~~

* Responce:

~~~json
{
  "data": {
    "allBlogs": [
      {
        "id": "5cd32e7b027439000721433f",
        "title": "newBlog",
        "article": "something",
        "createdAt": "2019-05-08T19:31:07.066Z",
        "updatedAt": "2019-05-08T19:31:07.066Z",
        "likes": 0,
        "comments": [
          {
            "content": "test, test, test"
          }
        ]
      },
      {
        "id": "5cd339640274390007214342",
        "title": "newBlog",
        "article": "something",
        "createdAt": "2019-05-08T20:17:40.294Z",
        "updatedAt": "2019-05-08T20:17:40.294Z",
        "likes": 0,
        "comments": []
      }
    ]
  }
}
~~~

### 2.4 - get all coments

* Request:

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

* Responce:

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

## 3 - UPDATE

### 3.1 update user

~~~json
{
  "Authorization": "Bearer __TOKEN__"
}
~~~

* Request:

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

* Responce:

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

### 3.2 update blog

~~~json
{
  "Authorization": "Bearer __TOKEN__"
}
~~~

* Request:

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

* Responce:

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

### 3.3 update comment

~~~json
{
  "Authorization": "Bearer __TOKEN__"
}
~~~

* Request:

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

* Responce:

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

### 3.4 like blog

* Request:

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

* Responce:

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

### 3.5 like comment

* Request:

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

* Responce:

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

## 3 - DELETE

### 3.1 delete user

~~~json
{
  "Authorization": "Bearer __TOKEN__"
}
~~~

* Request:

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

* Responce:

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

### 3.2 delete blog

~~~json
{
  "Authorization": "Bearer __TOKEN__"
}
~~~

* Request:

~~~graphql
mutation {
  deleteBlog(
    id:"5cd32f710274390007214341"
  ) {
    title
  }
}
~~~

* Responce:

~~~json
{
  "data": {
    "deleteBlog": {
      "id": "aaaaaaaaaaaaaaaa"
    }
  }
}
~~~

### 3.1 delete comment

~~~json
{
  "Authorization": "Bearer __TOKEN__"
}
~~~

* Request:

~~~graphql
mutation {
  deleteComment(
    id: "5cd32e880274390007214340"
  ) {
    content
  }
}
~~~

* Responce:

~~~json
{
  "data": {
    "deleteComment": {
      "content": "some comtent"
    }
  }
}
~~~