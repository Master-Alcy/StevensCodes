import React, { Component } from "react";
import { withRouter } from "react-router";
import firebase from "./firebase"
import { Form, Button } from 'react-bootstrap';

class SignInContainer extends Component {

    constructor(props)
    {
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

        try
        {
            let data = await firebase.auth().signInWithEmailAndPassword(email, password);
            console.log(data);
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
            return (
                <h1>Blogs</h1>
            );
        }
        else
        {
            return (
                <div>
                    <h1>Sign In</h1>
                    <Form onSubmit={this.handleSignIn}>
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
                        <Button type="submit">Sign In</Button>
                    </Form>
                </div>
            );
        }
        
    }
}

export default withRouter(SignInContainer);
