import React, { Component } from 'react';
<<<<<<< HEAD
import { Nav } from 'react-bootstrap';
=======
import { Nav, Button } from 'react-bootstrap';
>>>>>>> 887ef9b15c5adc7dcec8b96530399b6466e77bc6
import { ApolloConsumer } from 'react-apollo';

class LogOut extends Component {
    render() {
        return (
            <ApolloConsumer>
                {client => (
                    <div>
                        <Nav className="mr-auto">
                            <Nav.Link href='/create'>Post Blog</Nav.Link>
<<<<<<< HEAD
                            <Nav.Link href='/profile'>Profile</Nav.Link>
                            <Nav.Link href="/" onClick={() => {
                                client.writeData({ data: { isLoggedIn: false } });
                                localStorage.clear();
=======
                            <Nav.Link onClick={() => {
                                console.log(client);
                                client.writeData({ data: { isLoggedIn: false } });
                                localStorage.clear();
                                console.log("hello");
                                console.log(client);
>>>>>>> 887ef9b15c5adc7dcec8b96530399b6466e77bc6
                            }}>Log Out</Nav.Link>
                        </Nav>
                    </div>
                )}
            </ApolloConsumer>
        );
    }
}

export default LogOut;