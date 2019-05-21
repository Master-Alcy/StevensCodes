<<<<<<< HEAD
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
=======
// import React, {Component} from 'react';
// import { Mutation, Query } from 'react-apollo';
// import { Form, Button, Row, Container, Col } from 'react-bootstrap';
// //Import the file where my query constants are defined
// import queries from '../queries';
// import { Redirect } from 'react-router-dom';

// /* The React Apollo package grants access to a Query component, which takes a query as prop and executes it when its rendered. 
// That’s the important part: it executes the query when it is rendered. 
// It uses React’s render props pattern, using a child as a function implementation where you can access the result of the query as an argument.
// */
// class UpdateUser extends Component {
//     constructor(props) {
//         super(props);
//         this.state = {
//             name: "",
//             email: "",
//             address: "",
//             interest: "",
//             complete: false

//         };
//         this.handleChange = this.handleChange.bind(this);
//     }

//     handleChange = event => {
//         this.setState({ [event.target.name]: event.target.value });
//     };


//     render() {
//         if (this.state.complete){
//             return <Redirect to='/profile' />;
//         }
//         return (
//             <div>
//                 <Container>
//                     <Row className="justify-content-md-center">
//                         <Col lg={8}>
//                             <Query query={queries.ME}>
//                                 {({ data }) => {
//                                     if (!data) {
//                                         return (
//                                             <div>
//                                             </div>
//                                         );
//                                     }
//                                     const { me } = data;
//                                     if (!me) {
//                                         return (
//                                             <div>
//                                             </div>
//                                         );
//                                     } else {
//                                         return (
                                            
//                         <Mutation mutation={queries.UPDATE_USER} >
//                         {(updateUser, {data}) => (
//                             <Form
//                                 className='form'
//                                 id='update-user'
//                                 onSubmit={e => {
//                                     e.preventDefault();
//                                     updateUser({
//                                         variables: {
//                                             name: me.name,
//                                             password: me.password,
//                                             email: me.email,
//                                             phone: me.phone,
//                                             address: me.address,
//                                             interest: me.interest
                    
//                                         }
//                                     });    
//                                     this.setState({complete: true});
                                   
//                                     alert('user Updated');
                                   
//                                 }}>
//                                 <Form.Group controlId="user">
//                                     <Form.label>
//                                         User Name:
//                                     </Form.label>
//                                     <Form.Control
//                                     name="name"
//                                     type="name"
//                                     placeholder="User Name"
//                                     onChange={this.handleChange}
//                                     />
//                                     <br/>
//                                     <br/>
//                                     <Form.label>
//                                         Email:
//                                     </Form.label>
//                                     <Form.Control
//                                     name="email"
//                                     type="email"
//                                     placeholder="Email"
//                                     onChange={this.handleChange}
//                                                             />
//                                     <br/>
//                                     <br/>
//                                     <Form.label>
//                                         Password:
//                                     </Form.label>
//                                     <Form.Control
//                                     name="password"
//                                     type="password"
//                                     placeholder="Password"
//                                     onChange={this.handleChange}
//                                                             />
//                                     <Form.label>
//                                         Interest:
//                                     </Form.label>
//                                     <Form.Control
//                                     name="password"
//                                     type="password"
//                                     placeholder="Password"
//                                     onChange={this.handleChange}
//                                                             />                       

//                                 </Form.Group>
//                                 <br />                    
//                                 <br />
//                                 <br />
//                                 <br />
//                                 <button className='button add-button' type='submit'>
//                                     Update Profile
//                                 </button>
//                             </Form>
//                         )}
//                     </Mutation>
//                                         )}
//                                 }}
//                     <button className='button cancel-button' >
//                         Cancel
//                     </button>
//                     </Query>
//         </Col>
//         </Row>
//         </Container>
//         </div>
//         );
//     }
// }

// export default UpdateUser;
>>>>>>> 887ef9b15c5adc7dcec8b96530399b6466e77bc6
