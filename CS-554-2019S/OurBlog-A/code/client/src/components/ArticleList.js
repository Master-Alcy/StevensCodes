import React from "react";
// import { Form, Button, Row, Container, Col } from 'react-bootstrap';
import ArticleCard from './ArticleCard'

const ArticleList = props => {
    if (!props.articles.length) {
        return null;
    }
    return (
        <div>
            {props.articles.map((item, index) => {
                return <ArticleCard key={index} {...item} />;
            })}
        </div>
    );
}

export default ArticleList;