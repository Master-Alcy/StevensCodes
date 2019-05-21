import React from 'react';
import { Nav, Navbar, Container } from 'react-bootstrap';
import { BrowserRouter as Router, Route, Switch, Redirect } from 'react-router-dom';
import './App.css';

import SignIn from './SignIn';
import SignUp from './SignUp';
import HomePage from './HomePage';
import CreateArticle from './CreateArticle';
import ArticleItem from './components/ArticleItem';
import ShowProfile from './ShowProfile';
import AccountButtons from './components/AccountButtons';
import LogOut from './components/LogOut';
import UpdateUser from './components/UpdateUser'

function App(isLoggedIn) {
  return (
    <Router>
      <div className="App">
        <header className="App-header">
          <Navbar className="navbar">
            <Container fluid={true}>
              <Navbar.Brand href="/">
                <img
                  src="/blog.png"
                  width="50"
                  height="40"
                  className="d-inline-block align-top"
                  alt="OurBlog"
                />
              </Navbar.Brand>
              <Nav className="mr-auto">
                {isLoggedIn.isLoggedIn ? <LogOut /> : <AccountButtons isLoggedIn={isLoggedIn.isLoggedIn} />}
              </Nav>

            </Container>
          </Navbar>
          <br />

        </header>
        <Switch>
          <Route exact path="/" component={HomePage} />
          <PrivateRoute path="/signin" component={SignIn} isLoggedIn={isLoggedIn.isLoggedIn} />
          <PrivateRoute exact path="/signup" component={SignUp} isLoggedIn={isLoggedIn.isLoggedIn} />
          <ExtraPrivateRoute path="/create" component={CreateArticle} isLoggedIn={isLoggedIn.isLoggedIn} />
          <Route path="/article/:id" component={ArticleItem} />
          <ExtraPrivateRoute path="/profile/update" exact component={UpdateUser} isLoggedIn={isLoggedIn.isLoggedIn} />
          <ExtraPrivateRoute path="/profile/" component={ShowProfile} isLoggedIn={isLoggedIn.isLoggedIn} />

        </Switch>
      </div>
    </Router>
  );
}


const PrivateRoute = ({component: Component, isLoggedIn: isLoggedIn, ...rest}) => (
  <Route {...rest} render={(props) => (
    isLoggedIn === true
    ? <Redirect to='/' />
    : <Component {...props} />
  )} />

);

const ExtraPrivateRoute = ({component: Component, isLoggedIn: isLoggedIn, ...rest}) => (
  <Route {...rest} render={(props) => (
    isLoggedIn === false
    ? <Redirect to='/signup' />
    : <Component {...props} />
  )} />

);

export default App;
