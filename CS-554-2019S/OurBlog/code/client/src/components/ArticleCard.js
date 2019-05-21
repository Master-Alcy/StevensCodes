import React from "react";
import { Card } from 'react-bootstrap';
import LikeButton from './LikeButton';
import { Query } from 'react-apollo';
import queries from '../queries';

const ArticleCard = props => {
    return (
        <Query query={queries.GET_BLOG}
            variables={{ id: props.id }}
        >
            {({ data }) => {
<<<<<<< HEAD
=======
                console.log("data in card:", data)
>>>>>>> 887ef9b15c5adc7dcec8b96530399b6466e77bc6
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
<<<<<<< HEAD
                            <Card className = "card">
=======
                            <Card>
>>>>>>> 887ef9b15c5adc7dcec8b96530399b6466e77bc6
                                <Card.Body>
                                    <LikeButton all={getBlog} />
                                    <Card.Title>{getBlog.title}</Card.Title>
                                    <Card.Subtitle className="mb-2 text-muted">BY {getBlog.postedBy.name}</Card.Subtitle>
                                    {/* <Card.Subtitle className="mb-2 text-muted">Tag: {getBlog.relatedTag.tag}</Card.Subtitle> */}
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