import React, { Component } from 'react';
import { Button, Checkbox, Form } from 'semantic-ui-react'

const FormExampleForm = () => (
  <Form>
    <Form.Field>
      <label>First Name</label>
      <input placeholder='First Name' />
    </Form.Field>
    <Form.Field>
      <label>Last Name</label>
      <input placeholder='Last Name' />
    </Form.Field>
    <Form.Field>
      <Checkbox label='I agree to the Terms and Conditions' />
    </Form.Field>
    <Button type='submit'>Submit</Button>
  </Form>
)

class LoginPage extends Component {


    render() {
        return (
            <div>
                {FormExampleForm()}
            </div>
        )
    }
}

export default LoginPage;