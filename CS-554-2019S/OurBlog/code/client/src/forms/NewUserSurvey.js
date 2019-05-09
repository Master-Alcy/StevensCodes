import React, { Component } from "react";
import { Form, Button, Row, Container, Col } from 'react-bootstrap';
import { Query, Mutation } from 'react-apollo';
import ErrorPage from '../components/ErrorPage';
import queries from '../queries';

var im = require('imagemagick');

class NewUserSurvey extends Component {
    render() {
        // let name;
        let phone, address, interest;
        let street_address, address2, city, state, zipcode;
        return (
            <div>
                <Container>
                    <Row className="justify-content-md-center">
                        <Col lg={8}>
                            <Query query={queries.ME}>
                                {({ data }) => {
                                    if (!data) {
                                        return (
                                            <div>
                                                <ErrorPage />
                                            </div>
                                        );
                                    }
                                    const { me } = data;
                                    if (!me) {
                                        return (
                                            <div>
                                                <ErrorPage />
                                            </div>
                                        );
                                    } else {
                                        return (
                                            <Mutation mutation={queries.UPDATE_USER}>
                                                {(updateUser, { data }) => (
                                                    <Form onSubmit={e => {
                                                        e.preventDefault();
                                                        let address_arr = [street_address, address2.city, state, zipcode];
                                                        address = address_arr.join(", ");
                                                        updateUser({
                                                            variables: {
                                                                // name: name.value,
                                                                id: me.id,
                                                                phone: phone.value,
                                                                address: address,
                                                                interest: interest.value
                                                            }
                                                        });
                                                        // name.value = "";
                                                        phone.value = "";
                                                        interest.value = "";
                                                        street_address.value = "";
                                                        address2.value = "";
                                                        city.value = "";
                                                        state.value = "";
                                                        zipcode.value = "";
                                                    }}>
                                                        <Form.Group>
                                                            <Form.Label>Profile Image</Form.Label>
                                                            <Form.Control type="file" name="file" id="profile_img" />
                                                        </Form.Group>
                                                        {/* <Form.Group>
                                                    <Form.Label>Name</Form.Label>
                                                    <Form.Control
                                                        name="name"
                                                        type="name"
                                                        placeholder="Name"
                                                        ref={node => {
                                                            name = node
                                                        }}
                                                        required
                                                        autoFocus={true}
                                                    />
                                                </Form.Group> */}
                                                        <Form.Group>
                                                            <Form.Label>Phone Number</Form.Label>
                                                            <Form.Control
                                                                name="phone"
                                                                type="phone"
                                                                placeholder="Phone Number"
                                                                ref={node => {
                                                                    phone = node
                                                                }}
                                                            />
                                                        </Form.Group>
                                                        <Form.Group>
                                                            <Form.Label>Address</Form.Label>
                                                            <Form.Control
                                                                name="street_address"
                                                                type="street_address"
                                                                placeholder="1234 Main St"
                                                                ref={node => {
                                                                    street_address = node
                                                                }}
                                                            />
                                                        </Form.Group>
                                                        <Form.Group>
                                                            <Form.Label>Address 2</Form.Label>
                                                            <Form.Control
                                                                name="address2"
                                                                type="address2"
                                                                placeholder="Apartment, studio, or floor"
                                                                ref={node => {
                                                                    address2 = node
                                                                }}
                                                            />
                                                        </Form.Group>
                                                        <Row>
                                                            <Col md={6}>
                                                                <Form.Group>
                                                                    <Form.Label>City</Form.Label>
                                                                    <Form.Control
                                                                        name="city"
                                                                        type="city"
                                                                        ref={node => {
                                                                            city = node
                                                                        }}
                                                                    />
                                                                </Form.Group>
                                                            </Col>
                                                            <Col md={4}>
                                                                <Form.Group>
                                                                    <Form.Label>State</Form.Label>
                                                                    <Form.Control
                                                                        name="state"
                                                                        type="state"
                                                                        ref={node => {
                                                                            state = node
                                                                        }}
                                                                    />
                                                                </Form.Group>
                                                            </Col>
                                                            <Col md={2}>
                                                                <Form.Group>
                                                                    <Form.Label>Zip</Form.Label>
                                                                    <Form.Control
                                                                        name="zipcode"
                                                                        type="zipcode"
                                                                        ref={node => {
                                                                            zipcode = node
                                                                        }}
                                                                    />
                                                                </Form.Group>
                                                            </Col>
                                                        </Row>
                                                        <Form.Group controlId="interest">
                                                            <Form.Label>Interests</Form.Label>
                                                            <Form.Control as="textarea" rows="2"
                                                                ref={node => {
                                                                    interest = node;
                                                                }}
                                                            />
                                                        </Form.Group>
                                                        <Button variant="outline-primary" type="submit">Submit</Button>
                                                        <Button className="float-right" variant="outline-danger" type="cancel">Cancel</Button>
                                                    </Form>
                                                )}
                                            </Mutation>
                                    )}
                                }}
                            </Query>
                        </Col>
                    </Row>
                </Container>
            </div>
        );
    }
}

export default NewUserSurvey;