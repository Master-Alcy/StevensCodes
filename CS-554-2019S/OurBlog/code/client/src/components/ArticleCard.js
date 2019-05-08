import React from "react";
import { Card } from 'react-bootstrap';
import LikeButton from './LikeButton';

const ArticleCard = props => {
    console.log(props)
    return (
        <Card>
            <Card.Body>
                <LikeButton all={props} />
                <Card.Title>{props.title}</Card.Title>
                <Card.Subtitle className="mb-2 text-muted">BY {props.postedBy.name}</Card.Subtitle>
                <Card.Text>
                    {props.article.split(" ").slice(0,100).join(" ").concat('...')}
                </Card.Text>
                <Card.Link href={`/article/${props.id}`}>Read More...</Card.Link>
            </Card.Body>
        </Card>
    );
}

export default ArticleCard;