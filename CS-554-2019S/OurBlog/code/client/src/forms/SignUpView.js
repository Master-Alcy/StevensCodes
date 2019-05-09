import React from 'react';
import { Form, Button, Row, Col } from 'react-bootstrap';

const SignUpView = ({ onSubmit }) => {
    return (
        <div>
            <h1>Sign Up</h1>
            <Form method="POST" onSubmit={onSubmit}>
                <Form.Group>
                    <Form.Label>Email</Form.Label>
                    <Form.Control
                        name="email"
                        type="email"
                        placeholder="Email"
                    />
                </Form.Group>

                        <Form.Group>
                            <Form.Label>Password</Form.Label>
                            <Form.Control
                                name="password"
                                type="password"
                                placeholder="Password"
                            />
                        </Form.Group>
                        <Button type="submit">Sign Up</Button>
                    </Form>
                </Col>
            </Row>
        </div>
    );
};

export default SignUpView;