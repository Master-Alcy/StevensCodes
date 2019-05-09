import React, { Component } from "react";
import { withRouter } from "react-router";
import firebase from "./firebase"
import { Form, Button } from 'react-bootstrap';

import SignInContainer from './SignIn'

class SignUpContainer extends Component {
    
    constructor(props)
    {
        super(props);
        this.state = {
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

        try
        {
            let data = await firebase.auth().createUserWithEmailAndPassword(email, password);
            this.setState({ success: true });
        }
        catch(e)
        {
            console.log("error" + e);
        }
    };

    render() {

        if(this.state.success)
        {
            return <SignInContainer />;
        }
        else
        {
            return <div>
            <h1>Sign Up</h1>
                <Form onSubmit={this.handleSignUp}>
                    <Form.Group>
                        <Form.Label>Email</Form.Label>
                        <Form.Control
                            name="email"
                            type="email"
                            placeholder="Email"
                            value={this.state.email}
                            onChange = {this.handleInputChange}
                        />
                    </Form.Group>

                    <Form.Group>
                        <Form.Label>Password</Form.Label>
                        <Form.Control
                            name="password"
                            type="password"
                            placeholder="Password"
                            value={this.state.password}
                            onChange = {this.handleInputChange}
                        />
                    </Form.Group>
                    <Button type="submit">Sign Up</Button>
                </Form>
            </div>;
        }
    }
}

export default withRouter(SignUpContainer);