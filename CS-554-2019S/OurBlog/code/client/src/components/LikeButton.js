import React from "react";
import { Button } from 'react-bootstrap';
import { Mutation } from 'react-apollo';
import queries from '../queries';

const LikeButton = (all) => {
    return (
        <div>
            <Mutation mutation={queries.LIKE_BLOG}
                update={(cache, { data: { likeBlog } }) => {
                    const { allBlogs } = cache.readQuery({
                        query: queries.GET_ALL_BLOGS
                    });
                    cache.writeQuery({
                        query: queries.GET_ALL_BLOGS,
                        data: {
                            allBlogs: allBlogs
                        }
                    })
                }}
            >
                {(likeBlog, { data }) => {
                    return (
                        <div>
                            <Button className="float-right" variant="outline-danger" onClick={e => {
                                likeBlog({
                                    variables: {
                                        id: all.all.id
                                    }
                                });
                            }}>
                                {/* all.all.likes probably won't update with cache. try finding what data is instead */}
                                Like {data.likeBlog.likes}
                            </Button>
                        </div>
                    )
                }}

            </Mutation>
        </div>
    );
}

export default LikeButton;