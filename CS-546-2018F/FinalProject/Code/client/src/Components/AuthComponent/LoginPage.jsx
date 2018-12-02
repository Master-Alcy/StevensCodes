import React, { Component } from 'react';
import { Form } from 'semantic-ui-react'

class LoginPage extends Component {

  render() {
    return (
      <Form>
        <Form.Field>
          <Form.Input fluid label='Username' placeholder='Your Username' />
        </Form.Field>
        <Form.Field>
          <Form.Input fluid label='Password' placeholder='Your Password' />
        </Form.Field>
        <Form.Button>Submit</Form.Button>
      </Form>
    )
  }
}

export default LoginPage;