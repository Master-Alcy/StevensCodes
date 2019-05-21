import React, { Component } from "react";
import { Form, Button, ButtonGroup, Row, Container, Col } from 'react-bootstrap';
import ArticleList from './components/ArticleList';
import { Query, ApolloConsumer } from 'react-apollo';
import queries from './queries';

class HomePage extends Component {

    constructor(props) {
        super(props);
        this.state = {
            articles: [],
            tag: null,
            searchString: ""
        };
        this.fetchTag = this.fetchTag.bind(this);
    }

    handleChange = event => {
        this.setState({ [event.target.name]: event.target.value })
    }

    async fetchTag(blogs) {
        await this.setState(() => ({ articles: blogs }));
    };

    render() {
        return (
            <ApolloConsumer>
                {client => (
                    <div>
                        <Container>
                            <Row className="justify-content-md-center">
                                <Form inline onSubmit={async (e) => {
                                    e.preventDefault()
                                    const { data } = await client.query({
                                        query: queries.ELASTIC_SEARCH,
                                        variables: { searchString: this.state.searchString }
                                    });

                                    this.fetchTag(data.elasticSearch);
                                }}>
                                    <Form.Group controlId="searchBar">
                                        <Form.Label>Search</Form.Label>
                                        <Form.Control type="search" name="searchString" onChange={this.handleChange} />
                                    </Form.Group>
                                    <Button variant="primary" type="submit">
                                        Submit
    
                                </Button>
                                </Form>
                                <br />
                                <br />
                                <br />
                                <br />
                            </Row>
                            <Row>
                                <Col sm={2} className="float-left">
                                    <Query query={queries.GET_ALL_TAGS}>
                                        {({ data }) => {
                                            if (!data) {
                                                return null;
                                            }
                                            const { allTags } = data;
                                            if (!allTags) {
                                                return null;
                                            } else {
                                                return (
                                                    <div>
                                                        <Form.Label><b>Tags:</b></Form.Label>
                                                        <br />
                                                        <ButtonGroup vertical>
                                                            {allTags.map((tag) => {
                                                                return (
                                                                    <Button key={tag.id}
                                                                        onClick={async () => {
                                                                            const { data } = await client.query({
                                                                                query: queries.GET_TAG,
                                                                                variables: { id: tag.id }
                                                                            });
                                                                            await this.fetchTag(data.getTag.blogs);
                                                                        }}
                                                                    >{tag.tag}</Button>);
                                                            })}
                                                        </ButtonGroup>
                                                    </div>
                                                )
                                            }
                                        }}
                                    </Query>
                                </Col>
                                <Col sm={10} className="justify-content-md-center">
                                    <div>
                                        <Query query={queries.GET_ALL_BLOGS}>
                                            {({ loading, error, data }) => {
                                                if (data) {
                                                    let arr = data.allBlogs;
                                                    console.log("articles in state", this.state.articles)
                                                    if (arr && (this.state.articles.length === 0)) {
                                                        return <ArticleList articles={arr} />
                                                    }
                                                    else {
                                                        return <ArticleList articles={this.state.articles} />
                                                    }
                                                }
                                                return null

                                            }}
                                        </Query>
                                    </div>
                                </Col>
                            </Row>
                        </Container>
                    </div>
                )}
            </ApolloConsumer>
        )

    }

}

export default HomePage;