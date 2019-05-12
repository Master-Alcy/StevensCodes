import React, { Component } from 'react';
import { Nav } from 'react-bootstrap';
import { ApolloProvider, Query } from 'react-apollo';
import gql from 'graphql-tag';
import LogOut from './LogOut';

function AccountButtons(isLoggedIn) {
    return (
        <div>
        <Nav className="mr-auto">
            <Nav.Link href="/signin">SignIn</Nav.Link>
            <Nav.Link href="/signup">SignUp</Nav.Link>
        </Nav>
        </div>
    );
}

export default AccountButtons;