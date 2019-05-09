import React from "react";
import { Card } from 'react-bootstrap';
import LikeButton from './LikeButton';
import { Query } from 'react-apollo';
import queries from '../queries';
import ErrorPage from './ErrorPage';

const ArticleCard = props => {
    console.log(props)
    return (
        <Query query={queries.GET_BLOG}
            variables={{ id: props.id }}
        >
            {({ data }) => {
                if (!data) {
                    return (
                        <div>
                        </div>
                    );
                }
                const { getBlog } = data;
                if (!getBlog) {
                    return (
                        <div>
                        </div>
                    );
                } else {
                    return (
                        <div>
                            <Card>
                                <Card.Body>
                                    <LikeButton all={getBlog} />
                                    <Card.Title>{getBlog.title}</Card.Title>
                                    <Card.Subtitle className="mb-2 text-muted">BY {getBlog.postedBy.name}</Card.Subtitle>
                                    <Card.Subtitle className="mb-2 text-muted">Tags: {getBlog.tags.join(", ")}</Card.Subtitle>
                                    <Card.Text>
                                        {getBlog.article.split(" ").slice(0, 100).join(" ").concat('...')}
                                    </Card.Text>
                                    <Card.Link href={`/article/${getBlog.id}`}>Read More...</Card.Link>
                                </Card.Body>
                            </Card>
                        </div>
                    );
                }
            }
            }
        </Query>
    );
}

export default ArticleCard;