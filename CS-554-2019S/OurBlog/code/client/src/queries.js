import gql from 'graphql-tag';

const ME = gql`
    query {
        me {
            id
        }
    }
`;

const UPDATE_USER = gql`
    mutation updateUser ($id: String!, $phone: String, $address: String, $interest:String){
        updateUser(
            id: $id,
            phone: $phone,
            address: $address,
            interest: $interest
        ) {
            name
            phone
            address
            interest
        }
    }
`;

const POST_BLOG = gql`
mutation postBlog($title:String!, $article:String!){
    postBlog(
        title: $title, 
        article: $article
    ) {
      id
      title
    }
  }
`;

const GET_ALL_BLOGS = gql`
query {
    allBlogs {
        id
        createdAt
        updatedAt
        title
        article
        likes
        postedBy {
          id
          name
        }
        comments {
          id
        }
        tags {
            tag
        }
    }
}
`;

const ELASTIC_SEARCH = gql`
query elasticSearch($searchString: String){
    elasticSearch(
        searchString: $searchString
    ) {
        id
        title
        text
    }
}
`;

const GET_BLOG = gql`
    query getBlog($id: String!) {
        getBlog(
            id: $id
        ) {
            id
            createdAt
            updatedAt
            title
            article
            likes
            postedBy {
                id
                name
            }
            comments {
                id
            }
        }
    }
`;

const GET_ALL_TAGS = gql`
    query{
        allTags{
            id
            tag
        }
    }
`;

const LIKE_BLOG = gql`
    mutation likeBlog($id: ID!){
        likeBlog(
            id: $id
        ) {
            id
            title
            article
            likes
        }
    }
`;

export default {
    ME,
    UPDATE_USER,
    POST_BLOG,
    GET_ALL_BLOGS,
    ELASTIC_SEARCH,
    GET_BLOG,
    GET_ALL_TAGS,
    LIKE_BLOG
}