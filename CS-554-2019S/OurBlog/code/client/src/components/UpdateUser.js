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