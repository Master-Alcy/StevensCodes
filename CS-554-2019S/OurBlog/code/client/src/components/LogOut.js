import React, { Component } from 'react';
import { Nav, Button } from 'react-bootstrap';
import { ApolloConsumer } from 'react-apollo';

class LogOut extends Component {
    render() {
        return (
            <ApolloConsumer>
                {client => (
                    <div>
                        <Nav className="mr-auto">
                            <Nav.Link href='/create'>Post Blog</Nav.Link>
                            <Nav.Link onClick={() => {
                                console.log(client);
                                client.writeData({ data: { isLoggedIn: false } });
                                localStorage.clear();
                                console.log("hello");
                                console.log(client);
                            }}>Log Out</Nav.Link>
                        </Nav>
                    </div>
                )}
            </ApolloConsumer>
        );
    }
}

export default LogOut;