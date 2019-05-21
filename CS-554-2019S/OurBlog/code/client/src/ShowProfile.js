import React, { Component } from "react";
import queries from './queries';
import { Query } from 'react-apollo';
import { Card, Container, Row, Col, Button, ListGroup } from 'react-bootstrap';
import { Link } from 'react-router-dom'
class ShowProfile extends Component {
    constructor(props) {
        super(props);
        this.state = {
            address: "",
            name: "",
            interest: "",
            complete: false
        };

    }


    render() {
        return (<div>
            <Container>
                <Row className="justify-content-md-center">
                    <Col lg={8}>
                        <Query query={queries.ME}>
                            {({ data, refetch }) => {
                                if (!data) {
                                    return (
                                        <div>
                                        </div>
                                    );
                                }
                                const { me } = data;
                                refetch();
                                if (!me) {
                                    return (
                                        <div>
                                        </div>
                                    );
                                }

                                else {
                                    return (
                                        <div>
                                            <ListGroup className="justify-content-md-center">
                                                <ListGroup.Item >
                                                    <b>Name</b>: {me.name}
                                                </ListGroup.Item>

                                                <ListGroup.Item>
                                                    <b>Email</b>: {me.email}
                                                </ListGroup.Item>

                                                <ListGroup.Item>
                                                    <b>Phone</b>: {me.phone}
                                                </ListGroup.Item>

                                                <ListGroup.Item>
                                                    <b>Interest</b>: {me.interest}
                                                </ListGroup.Item>

                                                <ListGroup.Item>
                                                    <b>Address</b>: {me.address}
                                                </ListGroup.Item>

                                                <ListGroup.Item>
                                                    <b>Blogs</b>: {me.blogs.map((blog, index) => (
                                                        <ul> <a href={`/article/${blog.id}`}>{blog.title}</a></ul>
                                                    ))}
                                                </ListGroup.Item>

                                                <ListGroup.Item>

                                                    <b> Comments</b>: {me.comments.map((comment, index) => (
                                                        <Card.Header> <b>Blog:</b> {comment.forBlog ? <a href={`/article/${comment.forBlog.id}`}>{comment.forBlog.title}</a> : <p>Blog not found</p>}
                                                            <br />
                                                            <ListGroup.Item>  {comment.content} </ListGroup.Item>

                                                        </Card.Header>
                                                    ))}

                                                </ListGroup.Item>


                                            </ListGroup>
                                        </div>


                                    )
                                }
                            }}

                        </Query>
                    </Col>
                </Row>
                <Button variant='outline-primary'>
                    <Link to='/profile/update'>
                        Edit Profile
                     </Link>
                </Button>

            </Container>
        </div>)
    }
}


export default ShowProfile