import React, { Component } from 'react';
import { Form, Button, Row, Col, FormGroup } from 'react-bootstrap';
import { Query, Mutation } from 'react-apollo';
import queries from '../queries';
import { Link } from 'react-router-dom';


class NewArticle extends Component {
    constructor (props) {
        super(props);
        this.state = {
            title: "",
            article: "",
            tags: new Map()
        }

        this.handleChange = this.handleChange.bind(this);
        this.handleTextChange = this.handleTextChange.bind(this)
    }

    handleChange(e) {
        const item = e.target.name;
        const isChecked = e.target.checked;
        this.setState(prevState => ({ tags: prevState.tags.set(item, isChecked)}))
    }

    handleTextChange(e) {
        if (e.target.name === "title" || e.target.name === 'article'){
            this.setState({[e.target.name]: e.target.value});
        }
    }

    render () {
        return (
            <div>
                <Row className="justify-content-md-center">
                    <Col lg={8}>
                        <h1>Create an Article</h1>
                        <Mutation mutation={queries.POST_BLOG}>
                            {(postBlog, { data }) => (
                                <Form onSubmit={async (e) => {
                                    e.preventDefault();
                                    var finalTags = [];
                                    this.state.tags.forEach(function( val, key ) {
                                        if( val ) {
                                            finalTags.push(key);
                                        }
                                    });
                                    postBlog({
                                        variables: {
                                            title: this.state.title,
                                            article: this.state.article,
                                            tags: finalTags
                                        }
                                    });
                                    this.props.history.push('/profile');
                                }}>
                                    <Form.Group>
                                        <Form.Label>Title</Form.Label>
                                        <Form.Control
                                            name="title"
                                            type="title"
                                            placeholder="Title"
                                            onChange={this.handleTextChange}
                                            required
                                            autoFocus={true}
                                        />
                                    </Form.Group>
                                    <Form.Group controlId="article">
                                        <Form.Label>Content</Form.Label>
                                        <Form.Control as="textarea" rows="3"
                                            name="article"
                                            onChange={this.handleTextChange}
                                            required
                                        />
                                    </Form.Group>
                                    <FormGroup>
                                        <Form.Label>Tags</Form.Label>
                                        <Query query={queries.GET_ALL_TAGS}>
                                            {({ data, refetch }) => {
                                                if (!data) {
                                                    return null;
                                                }
                                                const { allTags } = data;
                                                if (!allTags) {
                                                    return null;
                                                }
                                                return (
                                                    <div>
                                                        {allTags.map((tag) => {
                                                            return (<Form.Check
                                                                custom
                                                                name={tag.tag}
                                                                label={tag.tag}
                                                                type="checkbox"
                                                                id={tag.id}
                                                                key={tag.id}
                                                                checked={this.state.tags.get(tag.name)}
                                                                onChange={this.handleChange}
                                                            />);
                                                        })}
                                                    </div>
                                                );
                                            }}
                                        </Query>
                                    </FormGroup>
                                    <Button variant="outline-primary" type="submit">Post</Button>
                                    <Link to={`/profile`}><Button className="float-right" variant="outline-danger" type="cancel" formNoValidate>Cancel</Button></Link>
                                </Form>
                            )}
                        </Mutation>
                    </Col>
                </Row>
            </div>
        );
    }
}

export default NewArticle;