import React, { Component } from 'react';
import { Button, Nav, Navbar, Form, NavDropdown, FormControl } from 'react-bootstrap';
import { BrowserRouter as Router, Route } from 'react-router-dom';
import './App.css';

import SignIn from './SignIn';
import SignUp from './SignUp';

class App extends Component {
  render() {
    return (
      <Router>
        <div className="App">
          <header className="App-header">
            <Navbar bg="dark" variant="dark">
              <Navbar.Brand href="#home">OurBlog</Navbar.Brand>
              <Nav className="mr-auto">
                <Nav.Link href="#home">Home</Nav.Link>
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
              <Form inline>
                <FormControl type="text" placeholder="Search" className="mr-sm-2" />
                <Button variant="outline-info">Search</Button>
              </Form>
            </Navbar>
            <br />

          </header>
          <switch>
            <Route path="/" />
            <Route path="/signin" component={SignIn} />
            <Route path="/signup" component={SignUp} />
            {/* <Route path="/pokemon/" component={PokemonListContainer} />
                  <Route path="/pokemon/" component={PokemonListContainer} /> */}
          </switch>
        </div>
      </Router>
    );
  }
}

export default App;
