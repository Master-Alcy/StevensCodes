import React from 'react';
import { Nav, Navbar, NavDropdown, Container } from 'react-bootstrap';
import { BrowserRouter as Router, Route, Switch } from 'react-router-dom';
import './App.css';

import SignIn from './SignIn';
import SignUp from './SignUp';
import HomePage from './HomePage';
import CreateArticle from './CreateArticle';
import NewUserSurvey from './forms/NewUserSurvey';

function App() {
  return (
    <Router>
      <div className="App">
        <header className="App-header">
          <Navbar bg="dark" variant="dark">
            <Container fluid={true}>
              <Navbar.Brand href="/">OurBlog</Navbar.Brand>
              <Nav className="mr-auto">
                <Nav.Link href="/">Home</Nav.Link>
                <NavDropdown title="Articles" id="collasible-nav-dropdown">
                  <NavDropdown.Item href="#action/3.1">Action</NavDropdown.Item>
                  <NavDropdown.Item href="#action/3.2">Another action</NavDropdown.Item>
                  <NavDropdown.Item href="#action/3.3">Something</NavDropdown.Item>
                  <NavDropdown.Divider />
                  <NavDropdown.Item href="#action/3.4">Separated link</NavDropdown.Item>
                </NavDropdown>
                <Nav.Link href="/signin">SignIn</Nav.Link>
                <Nav.Link href="/signup">SignUp</Nav.Link>
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
          {/* <Route path="/pokemon/" component={PokemonListContainer} />
                  <Route path="/pokemon/" component={PokemonListContainer} /> */}
        </Switch>
      </div>
    </Router>
  );
}

export default App;
