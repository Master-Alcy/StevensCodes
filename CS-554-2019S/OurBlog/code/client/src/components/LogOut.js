import React, { Component } from 'react';
import { Nav, Button } from 'react-bootstrap';
import { ApolloConsumer } from 'react-apollo';

class LogOut extends Component {
    render() {
        return (
            <ApolloConsumer>
                {client => (
                    <div>
                        <Nav.Link onClick={() => {
                            console.log(client);
                            client.writeData({ data: { isLoggedIn: false } });
                            localStorage.clear();
                            console.log("hello");
                            console.log(client);
                        }}>Log Out</Nav.Link>
                    </div>
                )}
            </ApolloConsumer>
        );
    }
}

export default LogOut;