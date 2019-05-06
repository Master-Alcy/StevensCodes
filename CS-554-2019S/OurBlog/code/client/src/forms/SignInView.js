import React from 'react';
import { Form, Button, Row, Col } from 'react-bootstrap';

const SignIpView = ({ onSubmit }) => {
    return (
        <div>
            <Row className="justify-content-md-center">
                <Col lg={4}>
                    <h1>Sign In</h1>
                    <Form onSubmit={onSubmit}>
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
                        <Button type="submit">Sign In</Button>
                    </Form>
                </Col>
            </Row>
        </div>
    );
};

export default SignIpView;