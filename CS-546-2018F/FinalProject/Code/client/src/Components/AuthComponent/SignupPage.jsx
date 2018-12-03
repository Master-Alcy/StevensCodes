import React, { Component } from 'react';
import { Form, Segment, Radio, Icon, Header } from 'semantic-ui-react';
import $ from 'jquery';
import Cookies from 'universal-cookie';

class SignupPage extends Component {
    constructor() {
        super();
        this.handleSubmit = this.handleSubmit.bind(this);
        this.handleChange = this.handleChange.bind(this);
        this.checkName = this.checkName.bind(this);
        this.checkPass = this.checkPass.bind(this);
        this.checkId = this.checkId.bind(this);
        this.checkSubmit = this.checkSubmit.bind(this);
        this.state = {
            username: "",
            hashedPassword: "",
            identity: "",
            checkName: false,
            checkPass: false,
            checkId: false,
            isSubmitted: false,
            isInvalid: false
        };
    }

    handleChange(event, { name, value }) { this.setState({ [name]: value }); }

    checkName() {
        let input = this.state.username;
        if (input === "") {
            return;
        } else if (/^[a-z]+$/i.test(input) && input.length >= 4) {
            if (!this.state.checkName) {
                this.setState({ checkName: true });
            }
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

    checkPass() {
        let input = this.state.hashedPassword;
        if (input === "") {
            return;
        } else if (/^[a-z0-9]+$/i.test(input) && input.length >= 8) {
            if (!this.state.checkPass) {
                this.setState({ checkPass: true });
            }
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
        let input = this.state.identity;
        if (input !== "") {
            if (!this.state.checkId) {
                this.setState({ checkId: true });
            }
            return (
                <div>
                    <Segment inverted color='green'>
                        <Icon name='check' />
                        You are a {input}
                    </Segment>
                </div>
            );
        }
    }

    checkSubmit() {
        if (this.state.isInvalid) {
            return (
                <div>
                    <Form.Button>Submit</Form.Button>
                    <Segment inverted color='red'>
                        <Icon loading name='spinner' />
                        Invalid Input. Must finish all three fields.
                    </Segment>
                </div>
            );
        }
        if (this.state.isSubmitted) {
            return (
                <div>
                    <Segment inverted color='green'>
                        <Icon name='check' />
                        Valid Input. Submitted.
                    </Segment>
                </div>
            );
        } else {
            return (<Form.Button>Submit</Form.Button>);
        }
    }

    handleSubmit() {
        debugger;
        event.preventDefault();
        if (!this.state.checkName || !this.state.checkPass || !this.state.checkId) {
            this.setState({ isInvalid: true });
            return;
        }

        const formdata = {
            username: this.state.username,
            hashedPassword: this.state.hashedPassword,
            identity: this.state.identity
        };
        const cookies = new Cookies();
        // fetch method is fully functional. All tests passed 
        // Turn to ajax to fullfill CS-546 Requirement
        
        // fetch('/user/signup', {
        //     method: 'POST',
        //     headers: {
        //         'Content-type': 'application/json'
        //     },
        //     body: JSON.stringify(formdata)
        // })
        // .then((response) => response.json())
        // .then((result) => {
        //     debugger;
        //     console.log(result);
        //     if (result.success) {
        //         cookies.set(result.identity,result.sessionId,{path: '/'});
        //         window.location.replace("http://localhost:3000/"+result.identity);
        //     } else {
        //         window.location.replace("http://localhost:3000/");
        //     }
        // });
        

        // AJAX
        let requestConfig = {
            url: "http://localhost:3000/user/signup",
            data: formdata,
            type: 'POST',
            dataType: 'json'
        };

        $.ajax(requestConfig).then((responseMessage) => {
            debugger;
            let newRes = $(responseMessage)[0];
            console.log(newRes);
            if (newRes.success) {
                cookies.set(newRes.identity,newRes.sessionId,{path: '/'});
                window.location.replace("http://localhost:3000/"+newRes.identity);
            } else {
                window.location.replace("http://localhost:3000/");
            }
        });

        if (!this.state.isSubmitted) {
            this.setState({ 
                isInvalid: false,
                isSubmitted: true 
            });
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
                        {this.checkName()}
                    </Form.Field>

                    <Form.Field>
                        <Form.Input fluid label='Password' name="hashedPassword"
                            value={hashedPassword} onChange={this.handleChange}
                            placeholder='Your Password' />
                        {this.checkPass()}
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
                    {this.checkSubmit()}
                </Form>

            </Segment>
        )
    }
}

export default SignupPage;