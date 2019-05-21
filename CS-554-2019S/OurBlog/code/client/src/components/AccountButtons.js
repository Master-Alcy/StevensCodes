import React from 'react';
import { Nav } from 'react-bootstrap';

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