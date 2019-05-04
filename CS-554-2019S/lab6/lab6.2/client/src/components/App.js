import React, { Component } from "react";
import { NavLink, BrowserRouter as Router, Route } from "react-router-dom";
import "./App.css";
import Home from "./Home";
import Quote from "./Quote";

class App extends Component {
  render() {
    return (
      <Router>
        <div>
          <header className="App-header">
            <h1 className="App-title">
              GraphQL With Apollo Client, Lab 6.2
            </h1>
            <nav>
              <NavLink className="navlink" to="/">
                Home
              </NavLink>
              <NavLink className="navlink" to="/quote">
                Chuck Norris Quote
              </NavLink>
            </nav>
          </header>
          <Route exact path="/" component={Home} />
          <Route path="/quote" component={Quote} />
        </div>
      </Router>
    );
  }
}

export default App;
