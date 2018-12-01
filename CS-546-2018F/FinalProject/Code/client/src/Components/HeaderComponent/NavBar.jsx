import React, { Component } from 'react';
import { Link } from 'react-router-dom';

class NavBar extends Component {
    showNav() {
        if (window.location.pathname === "/student") {
            return (
                <ul id="headerButtons">
                    <li className="navButton"><Link to="/">Home</Link></li>
                    <li className="navButton"><Link to="/student">Student Page</Link></li>
                </ul>
            )
        } else if (window.location.pathname === "/staff") {
            return (
                <ul id="headerButtons">
                    <li className="navButton"><Link to="/">Home</Link></li>
                    <li className="navButton"><Link to="/staff">Staff Page</Link></li>
                </ul>
            )
        } else {
            return (
                <ul id="headerButtons">
                    <li className="navButton"><Link to="/">Home</Link></li>
                    <li className="navButton"><Link to="/signup">Sign Up</Link></li>
                    <li className="navButton"><Link to="/login">Log In</Link></li>
                </ul>
            )
        }
    }

    render() {
        return (
            <header>
                {this.showNav()}
            </header>
        )
    }
}

export default NavBar;