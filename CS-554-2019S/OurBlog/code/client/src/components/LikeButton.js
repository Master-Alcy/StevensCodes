import React from "react";
import { Button } from 'react-bootstrap';
import gql from 'graphql-tag';
import { Mutation } from 'react-apollo';

const updateBlog = gql`
    mutation updateBlog($id: ID!, $likes: Int!){
        updateBlog(
            id: $id,
            likes: $likes
        ) {
            id
            title
            article
            likes
        }
    }
`;

const getAllBlogs = gql`
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

const LikeButton = (all) => {
    return (
        <div>
            <Mutation mutation={updateBlog}
                update={(cache, { data: { updateBlog } }) => {
                    const { allBlogs } = cache.readQuery({
                        query: getAllBlogs
                    });
                    cache.writeQuery({
                        query: getAllBlogs,
                        data: {
                            allBlogs: allBlogs
                        }
                    })
                }}
            >
                {(updateBlog, { data }) => (
                    <div>
                        <Button className="float-right" variant="outline-danger" onClick={ e => {
                                updateBlog({
                                    variables: {
                                        id: all.all.id,
                                        likes: all.all.likes + 1
                                    }
                                });
                        }}>
                        {/* all.all.likes probably won't update with cache. try finding what data is instead */}
                            Like {all.all.likes}
                        </Button>
                    </div>
                )}

            </Mutation>
        </div>
    );
}

export default LikeButton;