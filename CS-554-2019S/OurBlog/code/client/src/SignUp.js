import React, { Component } from "react";
import { withRouter } from "react-router";
import firebase from "./firebase"
import { Form, Button, Container, Row, Col } from 'react-bootstrap';
import { Mutation } from 'react-apollo';
import queries from './queries';

import SignInContainer from './SignIn'

class SignUpContainer extends Component {

    constructor(props) {
        super(props);
        this.state = {
            name: "",
            email: "",
            password: "",
            success: false
        }

        this.handleSignUp = this.handleSignUp.bind(this);
    }

    handleInputChange = event => {
        this.setState({ [event.target.name]: event.target.value });
    };

    handleSignUp = async event => {
        event.preventDefault();

        let email = this.state.email;
        let password = this.state.password;

        try {
            let data = await firebase.auth().createUserWithEmailAndPassword(email, password);
            this.setState({ success: true });
        }
        catch (e) {
            console.log("error" + e);
        }
    };

    render() {

        if (this.state.success) {
            return <SignInContainer />;
        }
        else {
            return <div>
                <Container>
                    <Row>
                        <Col lg={4}>
                            <h1>Sign Up</h1>
                            <Mutation mutation={queries.SIGN_UP}>
                                {(signup, { data }) => (
                                    <Form onSubmit={async (e) => {
                                        e.preventDefault();
                                        await this.handleSignUp;
                                        signup({
                                            variables: {
                                                email: this.state.email,
                                                password: this.state.password,
                                                name: this.state.name
                                            }
                                        });
                                    }}>
                                        <Form.Group>
                                            <Form.Label>Name</Form.Label>
                                            <Form.Control
                                                name="name"
                                                type="name"
                                                placeholder="Name"
                                                value={this.state.name}
                                                onChange={this.handleInputChange}
                                            />
                                        </Form.Group>

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
                                        <Button type="submit">Sign Up</Button>
                                    </Form>
                                )}
                            </Mutation>
                        </Col>
                    </Row>
                </Container>
            </div>;
        }
    }
}

export default withRouter(SignUpContainer);