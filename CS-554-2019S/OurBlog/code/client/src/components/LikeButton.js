import React from "react";
import { Button } from 'react-bootstrap';
import gql from 'graphql-tag';
import { Mutation } from 'react-apollo';

const likeBlog = gql`
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
            <Mutation mutation={likeBlog}
                update={(cache, { data: { likeBlog } }) => {
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
                {(likeBlog, { data }) => (
                    <div>
                        <Button className="float-right" variant="outline-danger" onClick={ e => {
                                likeBlog({
                                    variables: {
                                        id: all.all.id
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