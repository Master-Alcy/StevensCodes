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
    }
}
`;

export default {
    ME,
    UPDATE_USER,
    POST_BLOG,
    GET_ALL_BLOGS
}