import React, { Component } from 'react';
import { Nav } from 'react-bootstrap';
import { ApolloConsumer } from 'react-apollo';

class LogOut extends Component {
    render() {
        return (
            <ApolloConsumer>
                {client => (
                    <div>
                        <Nav className="mr-auto">
                            <Nav.Link href='/create'>Post Blog</Nav.Link>
                            <Nav.Link href='/profile'>Profile</Nav.Link>
                            <Nav.Link href="/" onClick={() => {
                                client.writeData({ data: { isLoggedIn: false } });
                                localStorage.clear();
                            }}>Log Out</Nav.Link>
                        </Nav>
                    </div>
                )}
            </ApolloConsumer>
        );
    }
}

export default LogOut;