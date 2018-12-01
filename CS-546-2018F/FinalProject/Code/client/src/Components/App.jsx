import React, { Component } from 'react';
import { BrowserRouter as Router, Route, Link } from 'react-router-dom';
import { browserHistory } from 'react-router';

import NavBar from './HeaderComponent/NavBar';
import Footer from './FooterComponent/Footer';

import HomePage from './HomePage';
import SignupPage from './Auth/SignupPage';
import LoginPage from './Auth/LoginPage';

class App extends Component {

    Auth() {
        if (AuthCookie){
            return;
        }
    }


    render() {
        return (
            <Router>
                <div>
                    <NavBar />
                    <Route name="home" exact path="/" component={HomePage} />
                    <Route name="sign" exact path="/signup" component={SignupPage} />
                    <Route name="log" exact path="/login" component={LoginPage} />
                    <Footer />
                </div>
            </Router>
        )
    }
}

export default App;