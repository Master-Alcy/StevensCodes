import React, { Component } from 'react';
import { Form, Segment, Radio } from 'semantic-ui-react'
import * as $ from 'jquery';

class SignupPage extends Component {
    constructor() {
        super();
        this.handleSubmit = this.handleSubmit.bind(this);
        this.handleInput = this.handleInput.bind(this);
        this.handleOption = this.handleOption.bind(this);
        this.state = {
            username: "",
            hashedPassword: "",
            identity: "",
            hasId: false
        };
    }

    handleSubmit() {
        console.log("In submit 222");
        //event.preventDefault();
        const formdata = {
            username: this.state.username,
            hashedPassword: this.state.hashedPassword,
            identity: this.state.identity
        };

        if (formdata.identity === "") {
            console.log("No ID");
            return;
        }

        console.log(formdata);

        fetch('http://localhost:3000/user', {
            method: 'POST',
            headers: {
                'Content-type': 'application/json'
            },
            body: JSON.stringify(formdata)
        }).then((response)=>response.json()).then((result)=>{
            console.log(result);
        })

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

    handleInput(event, { name, value }) {
        this.setState({
            [name]: value
        });
    }

    handleOption(event, { name, value }) {
        this.setState({
            [name]: value,
            hasId: true
        });
    }

    checkName(input) {
        return input + " mhm";
    }

    checkPass(input) {
        return input + " mhm";
    }

    render() {
        const { username, hashedPassword } = this.state
        console.log(this.state);
        return (
            <Segment raised>
                <Form onSubmit={this.handleSubmit}>
                    <Form.Field>
                        <Form.Input fluid label='Username' name="username"
                            value={username} onChange={this.handleInput}
                            placeholder='Your Username' />
                        <p>{this.checkName(this.state.username)}</p>
                    </Form.Field>
                    <Form.Field>
                        <Form.Input fluid label='Password' name="hashedPassword"
                            value={hashedPassword} onChange={this.handleInput}
                            placeholder='Your Password' />
                        <p>{this.checkPass(this.state.hashedPassword)}</p>
                    </Form.Field>
                    <Form.Group inline>
                        <label>Identity</label>
                        <Form.Field control={Radio} label='Staff'
                            value='staff' name="identity"
                            checked={this.state.identity === 'staff'}
                            onChange={this.handleOption}
                        />
                        <Form.Field control={Radio} label='Student'
                            value='student' name="identity"
                            checked={this.state.identity === 'student'}
                            onChange={this.handleOption}
                        />
                        <p>{this.state.identity}</p>
                    </Form.Group>
                    <Form.Button>Submit</Form.Button>
                </Form>
            </Segment>
        )
    }
}

export default SignupPage;