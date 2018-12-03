import React, { Component } from 'react';
import { Form, Segment, Radio, Icon, Header } from 'semantic-ui-react'
import * as $ from 'jquery';

class SignupPage extends Component {
    constructor() {
        super();
        this.handleSubmit = this.handleSubmit.bind(this);
        this.handleChange = this.handleChange.bind(this);
        this.state = {
            username: "",
            hashedPassword: "",
            identity: ""
        };
    }

    handleSubmit() {
        console.log("In submit 3");
        event.preventDefault();
        const formdata = {
            username: this.state.username,
            hashedPassword: this.state.hashedPassword,
            identity: this.state.identity
        };

        console.log(formdata);

        // fetch method success. Turn to ajax to fullfill
        // CS-546 Requirement
        fetch('/user', {
            method: 'POST',
            headers: {
                'Content-type': 'application/json'
            },
            body: JSON.stringify(formdata)
        }).then((response) => response.json()).then((result) => {
            console.log(result);
        });

        /*
        let requestConfig = {
            type: 'POST',
            url: "https://http://localhost:3000/user",
            data: formdata,
            dataType: JSON,
            success: (data) => {
                if (data.success === "true") {
                    console.log("We did it");
                } else {
                    console.log(data.msg);
                }
            },
            error: () => {
                console.log(error);
            }
        };

        $.ajax(requestConfig).then((responseMessage) => {
            let newRes = $(responseMessage);
            console.log(newRes);
        });
        */
    }

    handleChange(event, { name, value }) {
        this.setState({
            [name]: value
        });
    }

    checkName(input) {
        if (input === "") {
            return;
        } else if (/^[a-z]+$/i.test(input) && input.length >= 4) {
            return (
                <div>
                    <Segment inverted color='green'>
                        <Icon name='check' />
                        Valid Username
                    </Segment>
                </div>
            );
        } else {
            return (
                <div>
                    <Segment inverted color='yellow'>
                        <Icon loading name='spinner' />
                        Letters only, length 4 minimum, and no spaces.
                    </Segment>
                </div>
            );
        }
    }

    checkPass(input) {
        if (input === "") {
            return;
        } else if (/^[a-z0-9]+$/i.test(input) && input.length >= 8) {
            return (
                <div>
                    <Segment inverted color='green'>
                        <Icon name='check' />
                        Valid Password
                    </Segment>
                </div>
            );
        } else {
            return (
                <div>
                    <Segment inverted color='yellow'>
                        <Icon loading name='spinner' />
                        Letters and numbers only, length 8 minimum, and no spaces.
                    </Segment>
                </div>
            );
        }
    }

    checkId() {
        if (this.state.identity !== "") {
            return (
                <div>
                    <Segment inverted color='green'>
                        <Icon name='check' />
                        You are a {this.state.identity}
                    </Segment>
                </div>
            );
        }
    }

    render() {
        const { username, hashedPassword } = this.state
        console.log(this.state);
        return (
            <Segment raised>
                <Header size='medium'>User Sign Up</Header>
                <p>Please finish all fields.</p>

                <Form onSubmit={this.handleSubmit}>
                    <Form.Field>
                        <Form.Input fluid label='Username' name="username"
                            value={username} onChange={this.handleChange}
                            placeholder='Your Username' />
                        {this.checkName(this.state.username)}
                    </Form.Field>

                    <Form.Field>
                        <Form.Input fluid label='Password' name="hashedPassword"
                            value={hashedPassword} onChange={this.handleChange}
                            placeholder='Your Password' />
                        {this.checkPass(this.state.hashedPassword)}
                    </Form.Field>

                    <Form.Group inline>
                        <label>Identity</label>
                        <Form.Field control={Radio} label='Staff'
                            value='staff' name="identity"
                            checked={this.state.identity === 'staff'}
                            onChange={this.handleChange}
                        />

                        <Form.Field control={Radio} label='Student'
                            value='student' name="identity"
                            checked={this.state.identity === 'student'}
                            onChange={this.handleChange}
                        />
                        {this.checkId()}
                    </Form.Group>

                    <Form.Button>Submit</Form.Button>
                </Form>

            </Segment>
        )
    }
}

export default SignupPage;