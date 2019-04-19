# Instructions

## Test GraphQL

1. npm install
2. npm start
3. go to <http://localhost:5555/playground> to test graphql
4. test cases:

~~~graphql
mutation one {
  post(url: "www.aaa", description: "deas") {
    id
    url
    description
  }
}

query two {
  feed {
    id
    url
    description
  }
}
~~~

## Test Prisma

1. npm install
2. go to `code\server\data\prisma\README.md` for further instructions