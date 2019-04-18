import React, { Component } from 'react';
import { browserHistory, ReactDOM } from 'react-router';
import {
    BrowserRouter as Router,
    Route,
    Link,
    Redirect,
    Switch
} from 'react-router-dom';
import Cookies from 'universal-cookie';
const cookies = new Cookies();

import NavBar from './HeaderComponent/NavBar';
import Footer from './FooterComponent/Footer';

import HomePage from './HomePage';
import SignupPage from './AuthComponent/SignupPage';
import LoginPage from './AuthComponent/LoginPage';
import NotFound from './NotFound';

import StudentPage from './StudentComponent/StudentPage';
import StudentSearch from './StudentComponent/StudentSearch';
import StudentRecord from './StudentComponent/StudentRecord';

import StaffPage from './StaffComponent/StaffPage';
import StaffStore from './StaffComponent/StaffBookAddRemove';
import StaffInteraction from './StaffComponent/StaffBookRentReceive';
import StaffCheckStudent from './StaffComponent/StaffCheckStudent';
import StaffCheckBook from './StaffComponent/StaffCheckBook';

const Students = ({ match }) => (
    <Switch>
        <Route path={match.url + "/search"} component={StudentSearch} />
        <Route path={match.url + "/record"} component={StudentRecord} />
        <Route path={match.url} component={StudentPage} />
    </Switch>
);

const Staffs = ({ match }) => (
    <Switch>
        <Route path={match.url + "/bookstorage"} component={StaffStore} />
        <Route path={match.url + "/bookinteraction"} component={StaffInteraction} />
        <Route path={match.url + "/checkstudent"} component={StaffCheckStudent} />
        <Route path={match.url + "/checkbook"} component={StaffCheckBook} />
        <Route path={match.url} component={StaffPage} />
    </Switch>
);

class App extends Component {
    constructor() {
        super();
        this.state = {
            loader: 'init'
        }
    }

    componentDidMount() {
        const student = cookies.get('student');
        const staff = cookies.get('staff');
        let searchId;
        let isStudent;

        if (student) {
            searchId = '/user/' + student;
            isStudent = true;
        } else if (staff) {
            searchId = '/user/' + staff;
        }
        try {
            fetch(searchId, {
                method: 'POST',
                headers: {
                    'Content-type': 'application/json'
                },
                body: JSON.stringify({ isFind: false })
            })
                .then((response) => response.json())
                .then((result) => {
                    if (result.isFind) {
                        if (isStudent) {
                            this.setState({
                                loader: "student"
                            });
                            return;
                        }
                        this.setState({
                            loader: "staff"
                        });
                    }
                })
                .catch((e) => {
                    this.setState({
                        loader: "notfound"
                    });
                });
        } catch (err) {
            this.setState({
                loader: "error"
            });
        }
    }

    render() {
        const input = this.state.loader;
        if (input === 'student') {
            return (
                <Router>
                    <div>
                        <NavBar />
                        <Switch>
                            <Route name="home" exact path="/" component={HomePage} />
                            <Route name="sign" exact path="/signup" component={SignupPage} />
                            <Route name="log" exact path="/login" component={LoginPage} />
                            <Route name="student" path="/student" component={Students} />
                            <Route component={NotFound} />
                        </Switch>
                        <Footer />
                    </div>
                </Router>
            );
        } else if (input === 'staff') {
            return (
                <Router>
                    <div>
                        <NavBar />
                        <Switch>
                            <Route name="home" exact path="/" component={HomePage} />
                            <Route name="sign" exact path="/signup" component={SignupPage} />
                            <Route name="log" exact path="/login" component={LoginPage} />
                            <Route name="staff" path="/staff" component={Staffs} />
                            <Route component={NotFound} />
                        </Switch>
                        <Footer />
                    </div>
                </Router>
            );
        }
        return (
            <Router>
                <div>
                    <NavBar />
                    <Switch>
                        <Route name="home" exact path="/" component={HomePage} />
                        <Route name="sign" exact path="/signup" component={SignupPage} />
                        <Route name="log" exact path="/login" component={LoginPage} />
                        <Route component={NotFound} />
                    </Switch>
                    <Footer />
                </div>
            </Router>
        );
    }
}

export default App;