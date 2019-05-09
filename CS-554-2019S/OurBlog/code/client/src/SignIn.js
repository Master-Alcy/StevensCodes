import React, { Component } from "react";
import { withRouter } from "react-router";
import firebase from "./firebase";
import { Form, Button, Container, Row, Col } from 'react-bootstrap';
import { Mutation } from 'react-apollo';
import queries from './queries';

class SignInContainer extends Component {

    constructor(props) {
        super(props);
        this.state = {
            email: "",
            password: "",
            success: false
        }

        this.handleSignIn = this.handleSignIn.bind(this);
    }

    handleInputChange = event => {
        this.setState({ [event.target.name]: event.target.value });
    };

    handleSignIn = async event => {
        event.preventDefault();

        let email = this.state.email;
        let password = this.state.password;

        try {
            let data = await firebase.auth().signInWithEmailAndPassword(email, password);
            console.log(data);
            this.setState({ success: true });
        }
        catch (e) {
            console.log("error" + e);
        }
    };

    render() {

        if (this.state.success) {
            return (
                <h1>Blogs</h1>
            );
        }
        else {
            return (
                <div>
                    <Container>
                        <Row>
                            <Col lg={4}>
                                <h1>Sign In</h1>
                                <Mutation mutation={queries.LOGIN}>
                                    {(login, { data }) => (
                                        <Form onSubmit={async(e) => {
                                            e.preventDefault();
                                            await this.handleSignIn
                                            login({
                                                variables: {
                                                    email: this.state.email,
                                                    password: this.state.password
                                                }
                                            });
                                        }}>
                                            <Form.Group>
                                                <Form.Label>Email</Form.Label>
                                                <Form.Control
                                                    name="email"
                                                    type="email"
                                                    placeholder="Email"
                                                    value={this.state.email}
                                                    onChange={this.handleInputChange}
                                                />
                                            </Form.Group>

                                            <Form.Group>
                                                <Form.Label>Password</Form.Label>
                                                <Form.Control
                                                    name="password"
                                                    type="password"
                                                    placeholder="Password"
                                                    value={this.state.password}
                                                    onChange={this.handleInputChange}
                                                />
                                            </Form.Group>
                                            <Button type="submit">Sign In</Button>
                                        </Form>
                                    )};
                                </Mutation>
                            </Col>
                        </Row>
                    </Container>
                </div>
            );
        }

    }
}

export default withRouter(SignInContainer);
