import React, { Component } from 'react';
import { Row } from 'react-bootstrap';

class ErrorPage extends Component {
    render() {
        return (
            <Row className="justify-content-md-center">
                <div>
                    <h1>Error: Page Not Found</h1>
                </div>
            </Row>
        );
    }
}

export default ErrorPage;