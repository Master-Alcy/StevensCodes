import React, { Component } from "react";
import { Form, Button, Row, Container, Col } from 'react-bootstrap';
import ArticleList from './components/ArticleList';
import gql from 'graphql-tag';
import { Query } from 'react-apollo';

const getAllBlogs = gql`
query {
    allBlogs {
        id
        createdAt
        updatedAt
        title
        article
        likes
        postedBy {
          id
          name
        }
        comments {
          id
        }
    }
}
`;

class HomePage extends Component {

    constructor(props) {
        super(props);
        this.state = {
            articles: []
        };
    }

    render() {
        return (
            <div>
                <Container>
                    <Row className="justify-content-md-center">
                        <Form inline>
                            <Form.Group controlId="searchBar">
                                <Form.Label>Search</Form.Label>
                                <Form.Control type="search"/>
                            </Form.Group>
                            <Button variant="primary" type="submit">
                                Submit
                            </Button>
                        </Form>
                    </Row>
                    <Row className="justify-content-md-center">
                        <Col sm={2}>
                            <div>

                            </div>
                        </Col>
                        <Col sm={10} >
                            <Query query={getAllBlogs}>
                                {({ data }) => {
                                    if (!data) {
                                        return;
                                    }
                                    const { allBlogs } = data;
                                    if (!allBlogs) {
                                        return null;
                                    }
                                    // this.setState({articles: allBlogs})
                                    return (
                                        <div>
                                            <ArticleList articles={allBlogs}/>
                                        </div>
                                    );
                                }}
                            </Query>
                        </Col>
                    </Row>
                </Container>
            
            </div>
        );
    }

}

export default HomePage;