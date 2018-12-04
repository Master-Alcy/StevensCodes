import React, { Component } from 'react';
import { Form, Segment, Icon, Header } from 'semantic-ui-react';
import Cookies from 'universal-cookie';

class LoginPage extends Component {
  constructor() {
    super();
    this.handleSubmit = this.handleSubmit.bind(this);
    this.handleChange = this.handleChange.bind(this);
    this.checkName = this.checkName.bind(this);
    this.checkPass = this.checkPass.bind(this);
    this.checkSubmit = this.checkSubmit.bind(this);
    this.state = {
      username: "",
      hashedPassword: "",
      identity: "",
      checkName: false,
      checkPass: false,
      isSubmitted: false,
      isInvalid: false,
      message: ""
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

  checkSubmit() {
    if (this.state.isInvalid) {
      const msg = this.state.message;
      if (msg !== "") {
        return (
          <div>
            <Form.Button>Submit</Form.Button>
            <Segment inverted color='red'>
              <Icon loading name='spinner' />
              {msg}
                </Segment>
          </div>
        );
      }
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
    event.preventDefault();
    if (!this.state.checkName || !this.state.checkPass) {
      this.setState({ isInvalid: true });
      return;
    }

    const formdata = {
      username: this.state.username,
      hashedPassword: this.state.hashedPassword
    };
    const cookies = new Cookies();

    // Signup is implemented as jquery's AJAX
    // This is the same thing but with fetch
    fetch('/user/login', {
      method: 'POST',
      headers: {
        'Content-type': 'application/json'
      },
      body: JSON.stringify(formdata)
    })
      .then((response) => response.json())
      .then((result) => {
        console.log(result);
        if (result.isFind) {
          cookies.set(result.identity, result.sessionId, { path: '/' });
          window.location.replace("http://localhost:3000/" + result.identity);
        } else {
          this.setState({
            isInvalid: true,
            message: result.msg
          });
          return;
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
        <Header size='medium'>User Log In</Header>
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
          {this.checkSubmit()}
        </Form>
      </Segment>
    )
  }
}

export default LoginPage;