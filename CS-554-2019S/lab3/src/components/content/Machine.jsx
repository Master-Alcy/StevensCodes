import React, { Component } from 'react';
import { Link } from 'react-router-dom';

class InputArea extends Component {
    render() {
        return (
            <div class = "App-body">
                <h1>Api Test</h1>
                <Link to = "/pokemon">Pokemon</Link>
                <Link to = "/berries">Berry</Link>
                <Link to = "/machines">Machine</Link>
            </div>
        );
    }
}

export default InputArea;