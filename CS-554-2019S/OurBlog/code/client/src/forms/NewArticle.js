import React, { Component } from 'react';
import { Form, Button, Row, Col, FormGroup } from 'react-bootstrap';
import { Query, Mutation, ApolloConsumer } from 'react-apollo';
import queries from '../queries';
import { Link } from 'react-router-dom';


class NewArticle extends Component {
    constructor(props) {
        super(props);
        this.state = {
            title: "",
            article: "",
            tag: ""
        }

        this.handleChange = this.handleChange.bind(this);
        this.handleTextChange = this.handleTextChange.bind(this)
    }

    handleChange(e) {
        let val = e.target.id
        this.setState(prevState => ({ tag: val }))
    }

    handleTextChange(e) {
        if (e.target.name === "title" || e.target.name === 'article') {
            this.setState({ [e.target.name]: e.target.value });
        }
    }

    render() {
        return (
            <ApolloConsumer>
                {client =>
                    <Mutation mutation={queries.ADD_BLOG_TO_TAG_BY_ID}>
                        {(addBlogToTagById, { }) =>
                            <Mutation mutation={queries.POST_BLOG}
                                onCompleted={({ postBlog }) => {
                                    addBlogToTagById({
                                        variables: {
                                            tagId: this.state.tag,
                                            blogId: postBlog.id
                                        }
                                    });
                                }}
                            >
                                {(postBlog, { loading, error }) => {
                                    if (loading) return "Loading";
                                    if (error) return <p>An error occurred</p>;
                                    return (
                                        <Form onSubmit={async (e) => {
                                            e.preventDefault();
                                            postBlog({
                                                variables: {
                                                    title: this.state.title,
                                                    article: this.state.article
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
                                                                        value={tag.tag}
                                                                        type="radio"
                                                                        id={tag.id}
                                                                        key={tag.id}
                                                                        checked={this.state.tag === tag.id}
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
                                        </Form>)
                                }}

                            </Mutation>
                        }
                    </Mutation>
                }
            </ApolloConsumer>
        );
    }
}

export default NewArticle;