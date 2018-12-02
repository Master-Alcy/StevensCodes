import React, { Component } from 'react';
import { Form, Segment, Radio } from 'semantic-ui-react'

const choice = [
    { key: 'sta', text: 'Staff', value: 'staff' },
    { key: 'stu', text: 'Student', value: 'student' },
]

class SignupPage extends Component {
    constructor() {
        super();
        this.handleSubmit = this.handleSubmit.bind(this);
        this.handleInput = this.handleInput.bind(this);
        this.handleOption = this.handleOption.bind(this);
        this.state = {
            username: "",
            hashedPassword: "",
            identity: ""
        };
    }

    handleSubmit(event) {
        event.preventDefault();
        const data = event.target;
        console.log(data);
        console.log(data.username);
        console.log(data.hashedPassword);
        console.log(data.identity);
        console.log(value);

        fetch('/user', {
            method: 'POST',
            body: data,
        });
    }

    handleInput(event) {
        let target = event.target.name;
        let data = event.target;
        this.setState({
            [target]: data.value
        });

        console.log(this.state)
        console.log(data.name);
        // console.log(data.hashedPassword);
        // console.log(data.identity);
    }

    handleOption(event, { value }) {
        this.setState({
            value
        });
        console.log(value)
        console.log(this.state)
        // console.log(event.target.value);
    }

    render() {
        const { value } = this.state
        return (
            <Segment raised>
                <Form onSubmit={this.handleSubmit}>
                    <Form.Field>
                        <Form.Input fluid label='Username' name="username"
                            onChange={this.handleInput} value={this.state.username}
                            placeholder='Your Username' />
                    </Form.Field>
                    <Form.Field>
                        <Form.Input fluid label='Password' name="hashedPassword"
                            onChange={this.handleInput} value={this.state.hashedPassword}
                            placeholder='Your Password' />
                    </Form.Field>
                    <Form.Group inline>
                        <label>Identity</label>
                        <Form.Field
                            control={Radio}
                            label='Staff'
                            value='staff'
                            checked={value === 'staff'}
                            onChange={this.handleOption}
                        />
                        <Form.Field
                            control={Radio}
                            label='Student'
                            value='student'
                            checked={value === 'student'}
                            onChange={this.handleOption}
                        />
                    </Form.Group>
                    <Form.Button>Submit</Form.Button>
                </Form>
            </Segment>
        )
    }
}

export default SignupPage;