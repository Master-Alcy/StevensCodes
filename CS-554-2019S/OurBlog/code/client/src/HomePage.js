import React, { Component } from "react";
import { Form, Button, ButtonGroup, Row, Container, Col } from 'react-bootstrap';
import ArticleList from './components/ArticleList';
import { Query } from 'react-apollo';
import queries from './queries';
import ErrorPage from "./components/ErrorPage";

class HomePage extends Component {

    constructor(props) {
        super(props);
        this.state = {
            articles: []
        };
    }

    render() {
        let searchString = "";
        return (
            <div>
                <Container>
                    <Query query={queries.ELASTIC_SEARCH}
                            variables={{searchString: searchString}}
                    >
                    {({ loading, error, data, refetch, networkStatus }) => {
                        if (networkStatus === 4) return "Refetching!";
                        if (loading) return null;
                        if (error) return `Error! ${error}`;

                        if (!data) {
                            return (
                                <div>
                                    <ErrorPage />
                                </div>
                            );
                        }
                        const { elasticSearch } = data;
                        if (!elasticSearch) {
                            return (
                                <div>
                                    <ErrorPage />
                                </div>
                            );
                        }
                        else {
                            return (
                                <div>
                                    <Row className="justify-content-md-center">
                                        <Form inline onSubmit={() => {
                                            searchString = searchString.value
                                            refetch()
                                        }}>
                                            <Form.Group controlId="searchBar">
                                                <Form.Label>Search</Form.Label>
                                                <Form.Control type="search" name="searchString"/>
                                            </Form.Group>
                                            <Button variant="primary" type="submit">
                                                Submit
                                            </Button>
                                        </Form>
                                    </Row>
                                    <Row>
                                        <Col sm={2} className="float-left">
                                            <Query query={queries.GET_ALL_TAGS}>
                                                {({data}) => {
                                                    if(!data) {
                                                        return null;
                                                    }
                                                    const { allTags } = data;
                                                    console.log(allTags)
                                                    if(!allTags) {
                                                        return null;
                                                    } else {
                                                        return (
                                                            <div>
                                                                <Form.Label><b>Tags:</b></Form.Label> 
                                                                <br />
                                                                <ButtonGroup vertical>
                                                                    {allTags.map((tag) => {
                                                                        return <Button key={tag.id}>{tag.tag}</Button>
                                                                    })}
                                                                </ButtonGroup>
                                                            </div>
                                                        );
                                                    }
                                                }}
                                            </Query>
                                        </Col>
                                        <Col sm={10} className="justify-content-md-center">
                                            <div>
                                                <ArticleList articles={elasticSearch} />
                                            </div>
                                        </Col>
                                    </Row>
                                </div>
                            );
                        }}}
                    </Query>
                </Container>

            </div>
        );
    }

}

export default HomePage;