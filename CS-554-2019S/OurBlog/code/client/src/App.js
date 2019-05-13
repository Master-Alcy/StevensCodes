import React from 'react';
import { Nav, Navbar, NavDropdown, Container } from 'react-bootstrap';
import { BrowserRouter as Router, Route, Switch } from 'react-router-dom';
import './App.css';

import SignIn from './SignIn';
import SignUp from './SignUp';
import HomePage from './HomePage';
import CreateArticle from './CreateArticle';
import NewUserSurvey from './forms/NewUserSurvey';
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
          <Navbar bg="dark" variant="dark">
            <Container fluid={true}>
            <Navbar.Brand href="/">
            <img
            src="/blog.png"
            width="50"
            height="40"
            className="d-inline-block align-top"
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
          <Route path="/signin" component={SignIn} />
          <Route exact path="/signup" component={SignUp} />
          <Route path="/create" component={CreateArticle} />
          <Route path="/signup/survey" component={NewUserSurvey} />
          <Route path="/article/:id" component={ArticleItem} />
          <Route path="/profile/update" exact component={UpdateUser} />
          <Route path="/profile/" component={ShowProfile} />
          {/* <Route path="/pokemon/" component={PokemonListContainer} />
                  <Route path="/pokemon/" component={PokemonListContainer} /> */}
        </Switch>
      </div>
    </Router>
  );
}

export default App;
