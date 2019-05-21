import React from "react";
import { Button } from 'react-bootstrap';
import { Mutation } from 'react-apollo';
import queries from '../queries';

const LikeComment = (all) => {
    return (
        <div>
            <Mutation mutation={queries.LIKE_COMMENT}
                update={(cache, { data: { likeComment } }) => {
                    const { allComments } = cache.readQuery({
                        query: queries.GET_ALL_COMMENTS
                    });
                    cache.writeQuery({
                        query: queries.GET_ALL_COMMENTS,
                        data: {
                            allComments: allComments
                        }
                    })
                }}
            >
                {likeComment  => {
                    
                    return (
                        <div>
                            <Button className="float-right" variant="outline-danger" onClick={e => {
                                likeComment({
                                    variables: {
                                        id: all.all.id
                                    }
                                });
                            }}>
                                Likes {all.all.likes}
                            </Button>
                        </div>
                    )
                }}

            </Mutation>
        </div>
    );
}

export default LikeComment;