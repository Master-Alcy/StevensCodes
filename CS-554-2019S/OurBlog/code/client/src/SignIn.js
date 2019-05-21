import React, { Component } from "react";
import { withRouter } from "react-router";
import firebase from "./firebase";
import { Form, Button, Container, Row, Col } from 'react-bootstrap';
import { Mutation, ApolloConsumer } from 'react-apollo';
import queries from './queries';
import { Redirect } from 'react-router-dom';

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
            this.setState({ success: true });
        }
        catch (e) {
            console.log("error" + e);
        }
    };

    render() {
<<<<<<< HEAD
        if (this.state.success) {
            return (
                <Redirect to='/' />
=======

        if (this.state.success) {
            return (
                <Redirect to='/profile' />
>>>>>>> 887ef9b15c5adc7dcec8b96530399b6466e77bc6
            );
        }
        else {
            return (
                <ApolloConsumer>
                    {client =>
                        <Mutation mutation={queries.LOGIN}
                            onCompleted={({ login }) => {
                                localStorage.setItem('token', login.token);
                                client.writeData({ data: { isLoggedIn: true } });
                            }}
                        >
                            {(login, { loading, error }) => {
                                if (loading) return "Loading";
                                if (error) return <p>An error occurred</p>
                                return (
                                    <div>
                                        <Container>
                                            <Row className="justify-content-md-center">
                                                <Col lg={4}>
                                                    <h1>Sign In</h1>
                                                    <div>
                                                        <Form onSubmit={async (e) => {
                                                            e.preventDefault();
                                                            this.handleSignIn(e);
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
                                                    </div>
                                                </Col>
                                            </Row>
                                        </Container>
                                    </div>);
                            }}
                        </Mutation>
                    }
                </ApolloConsumer>
            );
        }

    }
}

export default withRouter(SignInContainer);
