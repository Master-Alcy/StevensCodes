import React, { Component } from 'react';
import { Message } from 'semantic-ui-react'

class NotFound extends Component {
    render() {
        return (
            <Message>
                <Message.Header>Wrong URL</Message.Header>
                <p>Page Not Found, you can redirect using the navigation bar.</p>
                <p>You probably do no have the authorization for this page.</p>
            </Message>
        )
    }
}

export default NotFound;