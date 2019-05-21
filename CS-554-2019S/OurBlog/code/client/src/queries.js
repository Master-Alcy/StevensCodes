import gql from 'graphql-tag';

const ME = gql`
query {
    me {
        id
        name
        email
        phone
        interest
        address
          blogs{
          id
          title
        }
          comments{
          id
          forBlog{
            id
            title
          }
          content
        }
    }
}
`;

const UPDATE_USER = gql`
    mutation updateUser ($name: String!, $email: String!, $phone: String, $address: String, $interest:String){
        updateUser(
            name: $name,
            email: $email,
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
    query getBlog($id: ID!) {
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
                content
            }
        }
    }
`;


const GET_ONLY_BLOG = gql`
    query getBlog($id: ID!) {
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
                content
                postedBy{
                    id
                    name
                }
                likes
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


const POST_COMMENT = gql`
mutation postComment($content:String!, $blogId:ID!){
    postComment(
        content: $content, 
        blogId: $blogId
    ) {
        id
        content
        postedBy{
          name
      }
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

const SIGN_UP = gql`
    mutation signup($name: String!, $email: String!, $password: String!) {
        signup(
            name: $name,
            password: $password,
            email: $email
        ) {
           token
           user {
               id
           }
        }
    }
`;

const LOGIN = gql`
    mutation login($email: String!, $password: String!){
        login(
            email: $email,
            password: $password
        ) {
            token
        }
    }
`;

const GET_TAG = gql`
query getTag ($id: ID!){
    getTag(
        id: $id
    ) {
        id
        tag
        blogs {
            id
            title
        }
    }
  }
`;

let TOKEN = "aaa";

const GET_USER = gql`
     query getUser($id: ID!){
        getUser(id: $id){
            id
            createdAt
            name
            password
            email
            phone
            address
            interest
            blogs{
                id
                title
                content
            }
            comments {
                id
              } 
        }

        
     }
`;

const POST_TAG = gql`
     mutation postTag($tag: String!, $blogId: ID!) {
         postTag(
             tag: $tag,
             blogId: $blogId
         ) {
            id
            tag
            blogs {
                id
                title
            }
         }
     }
`;

const ADD_BLOG_TO_TAG_BY_ID = gql`
     mutation addBlogToTagById($blogId: ID!, $tagId: ID!) {
         addBlogToTagById(
             blogId: $blogId,
             tagId: $tagId
         ) {
             id
             tag
         }
     }
`;

const LIKE_COMMENT = gql`
mutation likeComment($id: ID!){
    likeComment(
        id: $id
    ) {
        id
        content
        likes
    }
}
`;

const GET_ALL_COMMENTS = gql`
    query {
        allComments{
            id
            content
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
    POST_COMMENT,
    LIKE_BLOG,
    SIGN_UP,
    LOGIN,
    TOKEN,
    GET_USER,
    GET_TAG,
    GET_ONLY_BLOG,
    POST_TAG,
    ADD_BLOG_TO_TAG_BY_ID,
    LIKE_COMMENT,
    GET_ALL_COMMENTS
}