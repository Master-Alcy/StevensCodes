import React from 'react';
import { Form, Button, Row, Col } from 'react-bootstrap';
import { Mutation } from 'react-apollo';
import queries from '../queries';


let title, article;

const NewArticle = () => {
    return (
        <div>
            <Row className="justify-content-md-center">
                <Col lg={8}>
                    <h1>Create an Article</h1>
                    <Mutation mutation={queries.POST_BLOG}>
                        {(postBlog, { data }) => (
                            <Form onSubmit={e => {
                                e.preventDefault();
                                postBlog({
                                    variables: {
                                        title: title.value,
                                        article: article.value
                                    }
                                });
                                title.value = "";
                                article.value = "";
                            }}>
                                <Form.Group>
                                    <Form.Label>Title</Form.Label>
                                    <Form.Control
                                        name="title"
                                        type="title"
                                        placeholder="Title"
                                        ref={node => {
                                            title = node
                                        }}
                                        required
                                        autoFocus={true}
                                    />
                                </Form.Group>
                                <Form.Group controlId="article">
                                    <Form.Label>Content</Form.Label>
                                    <Form.Control as="textarea" rows="3"
                                        ref={node => {
                                            article = node;
                                        }}
                                        required
                                    />
                                </Form.Group>
                                <Button variant="outline-primary" type="submit">Post</Button>
                                <Button className="float-right" variant="outline-danger" type="cancel">Cancel</Button>
                            </Form>
                        )}
                    </Mutation>
                </Col>
            </Row>
        </div>
    );
}

export default NewArticle;