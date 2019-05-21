import React from 'react';
import { Nav, Navbar, Container } from 'react-bootstrap';
import { BrowserRouter as Router, Route, Switch, Redirect } from 'react-router-dom';
import './App.css';

import SignIn from './SignIn';
import SignUp from './SignUp';
import HomePage from './HomePage';
import CreateArticle from './CreateArticle';
<<<<<<< HEAD
=======
import NewUserSurvey from './forms/NewUserSurvey';
>>>>>>> 887ef9b15c5adc7dcec8b96530399b6466e77bc6
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
<<<<<<< HEAD
              <Navbar.Brand href="/">
                <img
                  src="/blog.png"
                  width="50"
                  height="40"
                  className="d-inline-block align-top"
                  alt="OurBlog"
                />
              </Navbar.Brand>
=======
            <Navbar.Brand href="/">
            <img
            src="/blog.png"
            width="50"
            height="40"
            className="d-inline-block align-top"
            />
    </Navbar.Brand>
>>>>>>> 887ef9b15c5adc7dcec8b96530399b6466e77bc6
              <Nav className="mr-auto">
                {isLoggedIn.isLoggedIn ? <LogOut /> : <AccountButtons isLoggedIn={isLoggedIn.isLoggedIn} />}
              </Nav>

            </Container>
          </Navbar>
          <br />

        </header>
        <Switch>
          <Route exact path="/" component={HomePage} />
<<<<<<< HEAD
          <PrivateRoute path="/signin" component={SignIn} isLoggedIn={isLoggedIn.isLoggedIn} />
          <PrivateRoute exact path="/signup" component={SignUp} isLoggedIn={isLoggedIn.isLoggedIn} />
          <ExtraPrivateRoute path="/create" component={CreateArticle} isLoggedIn={isLoggedIn.isLoggedIn} />
          <Route path="/article/:id" component={ArticleItem} />
          <ExtraPrivateRoute path="/profile/update" exact component={UpdateUser} isLoggedIn={isLoggedIn.isLoggedIn} />
          <ExtraPrivateRoute path="/profile/" component={ShowProfile} isLoggedIn={isLoggedIn.isLoggedIn} />

=======
          <Route path="/signin" component={SignIn} />
          <Route exact path="/signup" component={SignUp} />
          <Route path="/create" component={CreateArticle} />
          <Route path="/signup/survey" component={NewUserSurvey} />
          <Route path="/article/:id" component={ArticleItem} />
          <Route path="/profile/update" exact component={UpdateUser} />
          <Route path="/profile/" component={ShowProfile} />
          {/* <Route path="/pokemon/" component={PokemonListContainer} />
                  <Route path="/pokemon/" component={PokemonListContainer} /> */}
>>>>>>> 887ef9b15c5adc7dcec8b96530399b6466e77bc6
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
