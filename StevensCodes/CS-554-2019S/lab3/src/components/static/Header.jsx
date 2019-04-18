import React, { Component } from 'react';
import logo from '../../view/logo.svg';

class Header extends Component {
    render() {
        return (
            <header className="App-header">
                <img src={logo} className="App-logo" alt="logo" />
                <h1>Learning React. This is lab3.</h1>
            </header>
        );
    }
}

export default Header;