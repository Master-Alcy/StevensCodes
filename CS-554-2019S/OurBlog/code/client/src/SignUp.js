import React, { Component } from "react";
import { withRouter } from "react-router";
import firebase from "./firebase"
import { Form, Button, Container, Row, Col } from 'react-bootstrap';
import { Mutation, ApolloConsumer } from 'react-apollo';
import queries from './queries';

import { Redirect } from 'react-router-dom';

class SignUpContainer extends Component {

    constructor(props) {
        super(props);
        this.state = {
            name: "",
            email: "",
            password: "",
            success: false,
<<<<<<< HEAD
            id: "",
            alert: ""
        }

        this.handleSignUp = this.handleSignUp.bind(this);
        this.submissionCheck = this.submissionCheck.bind(this);
=======
            id: ""
        }

        this.handleSignUp = this.handleSignUp.bind(this);
>>>>>>> 887ef9b15c5adc7dcec8b96530399b6466e77bc6
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

<<<<<<< HEAD
    async ValidateEmail() {
        var mail = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
        if (this.state.email.match(mail)) {
            return true;
        }
        await this.setState(prevState => ({alert: "Please enter a valid email address."}));
        return false;
    }

    async checkPassword(){
        var re = /(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}/;
        if(this.state.password.match(re)){
            return true;
        }
        else {
            await this.setState(prevState => ({alert: "Please enter password of at least 8 characters include at least 1 capital letter, 1 lowercase letter, 1 number, and 1 special character."}));
            return false;
=======
    render() {
        console.log("state.success", this.state.success);
        if (this.state.success) {
            return <Redirect to='/signup/survey' />;
        }
        else {
            return (
                <ApolloConsumer>
                    {client =>
                        <Mutation mutation={queries.SIGN_UP}
                            onCompleted={({ signup }) => {
                                localStorage.setItem('token', signup.token);
                                client.writeData({ data: { isLoggedIn: true } });
                                this.setState({id: signup.user.id});
                            }}
                        >
                            {(signup, { loading, error }) => {
                                if (loading) return "Loading";
                                if (error) return <p>An error occurred</p>;
                                return (
                                    <div>
                                        <Container>
                                            <Row className="justify-content-md-center">
                                                <Col lg={4}>
                                                    <h1>Sign Up</h1>
                                                    <Form onSubmit={async (e) => {
                                                        e.preventDefault();
                                                        this.handleSignUp(e);
                                                        console.log(this.state);
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
                                                </Col>
                                            </Row>
                                        </Container>
                                    </div>)
                            }}
                        </Mutation>
                    }
                </ApolloConsumer>)
                ;
>>>>>>> 887ef9b15c5adc7dcec8b96530399b6466e77bc6
        }
    }

    async submissionCheck() {
        this.setState({alert: ""});
        let email = await this.ValidateEmail()
        if (!email) {
            alert(this.state.alert);
            return false;
        } 
        let pass = await this.checkPassword();
        if (!pass) {
            alert(this.state.alert);
            return false;
        } else {
            return true;
        }
    }


render() {
    if (this.state.success) {
        return <Redirect to='/' />;
    }
    else {
        return (
            <ApolloConsumer>
                {client =>
                    <Mutation mutation={queries.SIGN_UP}
                        onCompleted={({ signup }) => {
                            localStorage.setItem('token', signup.token);
                            client.writeData({ data: { isLoggedIn: true } });
                            this.setState({ id: signup.user.id });
                        }}
                    >
                        {(signup, { loading, error }) => {
                            if (loading) return "Loading";
                            if (error) return <p>An error occurred</p>;
                            return (
                                <div>
                                    <Container>
                                        <Row className="justify-content-md-center">
                                            <Col lg={4}>
                                                <h1>Sign Up</h1>
                                                <Form onSubmit={async (e) => {
                                                    e.preventDefault();
                                                    let check = await this.submissionCheck();
                                                    if (check) {
                                                        this.handleSignUp(e);
                                                        signup({
                                                            variables: {
                                                                email: this.state.email,
                                                                password: this.state.password,
                                                                name: this.state.name
                                                            }
                                                        });
                                                    }
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
                                            </Col>
                                        </Row>
                                    </Container>
                                </div>)
                        }}
                    </Mutation>
                }
            </ApolloConsumer>)
            ;
    }
}
}

export default withRouter(SignUpContainer);