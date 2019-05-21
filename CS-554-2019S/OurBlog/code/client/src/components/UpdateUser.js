import React, { Component } from 'react';
import { Mutation, Query, ApolloConsumer } from 'react-apollo';
import { Form, Button} from 'react-bootstrap';
import queries from '../queries';
import { Redirect, Link } from 'react-router-dom';

/* The React Apollo package grants access to a Query component, which takes a query as prop and executes it when its rendered. 
That’s the important part: it executes the query when it is rendered. 
It uses React’s render props pattern, using a child as a function implementation where you can access the result of the query as an argument.
*/
class UpdateUser extends Component {
    constructor(props) {
        super(props);
        this.state = {
            name: "",
            password: "",
            email: "",
            address: "",
            interest: "",
            phone: "",
            complete: false,
            isInitialLoad: true

        };
        this.handleChange = this.handleChange.bind(this);
    }

    handleChange = e => {

        this.setState({ [e.target.name]: e.target.value });
    };

    addMeData = me => {
        if (me && this.state.isInitialLoad) {
            this.setState({ name: me.name, address: me.address, phone: me.phone, interest: me.interest, isInitialLoad: false })
        }
    }

    render() {
        if (this.state.complete) {
            return <Redirect to='/profile' />;
        }
        return (

            <ApolloConsumer>
                {client =>
                    <Query query={queries.ME}>
                        {({ data, refetch }) => {
                            if (!data) {
                                return (
                                    <div>
                                    </div>
                                );
                            }
                            const { me } = data;
                            refetch();
                            this.addMeData(me);
                            if (!me) {
                                return (
                                    <div>
                                    </div>
                                );
                            } else {
                                return (
                                    <Mutation mutation={queries.UPDATE_USER}>
                                        {(updateUser, { data }) => (
                                            <Form
                                                className='form'
                                                id='update-user'
                                                onSubmit={async (e) => {
                                                    e.preventDefault();
                                                    updateUser({
                                                        variables: {
                                                            name: this.state.name ? this.state.name : me.name,
                                                            email: this.state.email,
                                                            phone: this.state.phone ? this.state.phone : me.phone,
                                                            address: this.state.address ? this.state.address : me.address,
                                                            interest: this.state.interest ? this.state.interest : me.interest

                                                        }
                                                    });
                                                    this.setState({ complete: true });

                                                    alert('user Updated');

                                                }}>
                                                <Form.Group >
                                                    <Form.Label>
                                                        <b>User Name:</b>
                                                    </Form.Label>
                                                    <Form.Control
                                                        name="name"
                                                        type="name"
                                                        placeholder="User Name"
                                                        required
                                                        value={this.state.name}
                                                        onChange={this.handleChange}
                                                    />
                                                    <br />

                                                    <Form.Label>
                                                        <b>Interest:</b>
                                                    </Form.Label>
                                                    <Form.Control
                                                        name="interest"
                                                        type="interest"
                                                        placeholder="Interest"
                                                        required
                                                        value={this.state.interest}
                                                        onChange={this.handleChange}
                                                    />
                                                    <br />
                                                    <Form.Label>
                                                        <b>Phone:</b>
                                                    </Form.Label>
                                                    <Form.Control
                                                        name="phone"
                                                        type="phone"
                                                        placeholder="Phone"
                                                        required
                                                        value={this.state.phone}
                                                        onChange={this.handleChange}
                                                    />
                                                    <br />
                                                    <Form.Label>
                                                        <b>Address:</b>
                                                    </Form.Label>
                                                    <Form.Control
                                                        name="address"
                                                        type="address"
                                                        placeholder="Address"
                                                        required
                                                        value={this.state.address}
                                                        onChange={this.handleChange}
                                                    />

                                                </Form.Group>
                                                <br />
                                                <br />
                                                <br />
                                                <br />
                                                <Button variant="outline-primary" type="submit">Update Profile</Button>
                                                <Link to={`/profile`}><Button className="float-right" variant="outline-danger" type="cancel" formNoValidate>Cancel</Button></Link>
                                            </Form>
                                        )}


                                    </Mutation>
                                )
                            }
                        }
                        }
                    </Query>
                }

            </ApolloConsumer>

        )
    }
}


export default UpdateUser;
