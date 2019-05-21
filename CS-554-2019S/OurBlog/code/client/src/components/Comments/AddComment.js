<<<<<<< HEAD
import React, { Component } from 'react';
import { Query, Mutation } from 'react-apollo';
import { Form, Button, Row, Col } from 'react-bootstrap';
=======
import React, {Component} from 'react';
import {Query, Mutation} from 'react-apollo';
import { Form, Button, Row, Col, FormGroup, Card } from 'react-bootstrap';
>>>>>>> 887ef9b15c5adc7dcec8b96530399b6466e77bc6
import queries from '../../queries';

class AddComment extends Component {
    constructor(props) {
        super(props);
        this.state = {
            showAddComment: this.props.isOpen,
            comment: '',
            blogId: '',
            name: '',
        };
        this.handleOpenAddComment = this.handleOpenAddComment.bind(this);
        this.handleCloseAddComment = this.handleCloseAddComment.bind(this);
        this.handleChange = this.handleChange.bind(this);
    }

<<<<<<< HEAD
    componentDidMount() {
        this.setState({ blogId: this.props.blogId })
    }

    handleChange(event) {
        this.setState({ comment: event.target.value });
    }

    handleOpenAddComment() {
        this.setState({ showAddComment: true });
    }

    handleCloseAddComment() {
        this.setState({ comment: "" });
        this.setState({ showAddComment: false });
=======
    componentDidMount(){
        this.setState({blogId: this.props.blogId})
    }

    handleChange(event){
        this.setState({comment: event.target.value});
    }

    handleOpenAddComment() {
        this.setState({showAddComment: true});
    }

    handleCloseAddComment() {
        this.setState({comment: "", blogId: ""});
        this.setState({showAddComment: false});
>>>>>>> 887ef9b15c5adc7dcec8b96530399b6466e77bc6
        this.props.handleClose(false);
    }

    render() {
<<<<<<< HEAD
        let content;
        return (
            <div>
                <Row className="justify-content-md-center">
                    <Col lg={8}>
                        <Query query={queries.ME}>
                            {({ data }) => {
                                if (!data) {
                                    return (
                                        <div>
                                        </div>
                                    );
                                }
                                const { me } = data;
                                if (!me) {
                                    return (
                                        <div>
                                        </div>
                                    );
                                } else {
                                    return (
                                        <Mutation mutation={queries.POST_COMMENT}>
                                            {(postComment, { data }) => (
                                                <Form onSubmit={async (e) => {
                                                    e.preventDefault();
                                                    
                                                    postComment({
                                                        variables: {
                                                            content: this.state.comment,
                                                            blogId: this.state.blogId
                                                        }
                                                    });
                                                    this.handleCloseAddComment();
                                                    content.value = "";
                                                }}>
                                                    <Form.Group controlId="comment">
                                                        <Form.Label>Comment</Form.Label>
                                                        <Form.Control as="textarea" name="comment" value={this.state.value} onChange={this.handleChange} rows="3"
                                                            ref={node => {
                                                                content = node;
                                                            }}
                                                            required
                                                        />

                                                    </Form.Group>
                                                    <div className="card-footer"> <b>You:</b> {me.name} </div>
                                                    
                                                     <Button variant="outline-primary" type="submit">Post</Button>
                                                    
                                                </Form>
                                            )}
                                        </Mutation>
                                    )
                                }
                            }}
                        </Query>
                    </Col>
                </Row>

=======
        let content, blogId;
        return(
            <div>
                <Row className="justify-content-md-center">
                    <Col lg={8}>
                    <Query query={queries.ME}>
                                {({ data }) => {
                                    if (!data) {
                                        return (
                                            <div>
                                            </div>
                                        );
                                    }
                                    const { me } = data;
                                    if (!me) {
                                        return (
                                            <div>
                                            </div>
                                        );
                                    } else {
                                        return (
                    <Mutation mutation={queries.POST_COMMENT}>
                            {(postComment, { data }) => (
                                <Form onSubmit={async (e) => {
                                    e.preventDefault();
                                    //console.log(this.state.comment, this.state.blogId);
                                    postComment({
                                        variables: {
                                            content: this.state.comment,
                                            blogId: this.state.blogId
                                        }
                                    });

                                   
                                alert('Comment Added');
                                this.handleCloseAddComment();
                            }}>
                            <Form.Group controlId="comment">
                                        <Form.Label>Comment</Form.Label>
                                        <Form.Control as="textarea" name="comment" value={this.state.value} onChange={this.handleChange} rows="3"
                                            ref={node => {
                                                content = node;
                                            }}
                                            required
                                        />
                                      
                                    </Form.Group>
                                    <div className= "card-footer"> <b>You:</b> {me.name} </div>
                                    <Button variant="outline-primary" type="submit">Post</Button>
                                </Form>
                            )}
                        </Mutation>    
                                        )}
                                }}
                     </Query>         
                        </Col>
                </Row>
               
>>>>>>> 887ef9b15c5adc7dcec8b96530399b6466e77bc6
            </div>
        );
    }
}



export default AddComment;