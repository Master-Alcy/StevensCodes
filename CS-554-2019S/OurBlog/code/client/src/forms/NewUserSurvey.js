import React, { Component } from "react";
import { Form, Button, Row, Container, Col } from 'react-bootstrap';
import { Query, Mutation } from 'react-apollo';
// import ErrorPage from '../components/ErrorPage';
import queries from '../queries';
import { Redirect } from 'react-router-dom';

class NewUserSurvey extends Component {
    constructor(props) {
        super(props);
        this.state ={
            street_address: "",
            address2: "",
            city: "",
            state: "",
            zipcode: "",
            phone: "",
            interest: "",
            complete: false
        }
        this.handleChange = this.handleChange.bind(this);
    }

    handleChange = event => {
        this.setState({ [event.target.name]: event.target.value });
    };

    render() {
        if (this.state.complete){
            return <Redirect to='/' />;
        }
        let address;
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
                                            </div>
                                        );
                                    }
                                    const { me } = data;
                                    if (!me) {
                                        return (
                                            <div>
                                            </div>
                                        );
                                    } else {
                                        return (
                                            <Mutation mutation={queries.UPDATE_USER}>
                                                {(updateUser, { data }) => (
                                                    <Form onSubmit={e => {
                                                        e.preventDefault();
                                                        let address_arr = [this.state.street_address, this.state.address2, this.state.city, this.state.state, this.state.zipcode];
                                                        address = address_arr.join(", ");
                                                        updateUser({
                                                            variables: {
                                                                name: me.name,
                                                                email: me.email,
                                                                phone: this.state.phone,
                                                                address: address,
                                                                interest: this.state.interest
                                                            }
                                                        });
                                                        this.setState({complete: true});
                                                        
                                                    }}>
                                                        <Form.Group>
                                                            <Form.Label>Phone Number</Form.Label>
                                                            <Form.Control
                                                                name="phone"
                                                                type="phone"
                                                                placeholder="Phone Number"
                                                                onChange={this.handleChange}
                                                            />
                                                        </Form.Group>
                                                        <Form.Group>
                                                            <Form.Label>Address</Form.Label>
                                                            <Form.Control
                                                                name="street_address"
                                                                type="street_address"
                                                                placeholder="1234 Main St"
                                                                onChange={this.handleChange}
                                                            />
                                                        </Form.Group>
                                                        <Form.Group>
                                                            <Form.Label>Address 2</Form.Label>
                                                            <Form.Control
                                                                name="address2"
                                                                type="address2"
                                                                placeholder="Apartment, studio, or floor"
                                                                onChange={this.handleChange}
                                                            />
                                                        </Form.Group>
                                                        <Row>
                                                            <Col md={6}>
                                                                <Form.Group>
                                                                    <Form.Label>City</Form.Label>
                                                                    <Form.Control
                                                                        name="city"
                                                                        type="city"
                                                                        onChange={this.handleChange}
                                                                    />
                                                                </Form.Group>
                                                            </Col>
                                                            <Col md={4}>
                                                                <Form.Group>
                                                                    <Form.Label>State</Form.Label>
                                                                    <Form.Control
                                                                        name="state"
                                                                        type="state"
                                                                        onChange={this.handleChange}
                                                                    />
                                                                </Form.Group>
                                                            </Col>
                                                            <Col md={2}>
                                                                <Form.Group>
                                                                    <Form.Label>Zip</Form.Label>
                                                                    <Form.Control
                                                                        name="zipcode"
                                                                        type="zipcode"
                                                                        onChange={this.handleChange}
                                                                    />
                                                                </Form.Group>
                                                            </Col>
                                                        </Row>
                                                        <Form.Group controlId="interest">
                                                            <Form.Label>Interests</Form.Label>
                                                            <Form.Control name="interest" as="textarea" rows="2"
                                                                onChange={this.handleChange}
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