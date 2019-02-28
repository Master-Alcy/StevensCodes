"use strict";
// React imports
import React, { Component } from 'react';
import { browserHistory, ReactDOM } from 'react-router';
import {
    BrowserRouter as Router,
    Route,
    Link,
    Redirect,
    Switch
} from 'react-router-dom';
// Render imports
import './view/App.css';
// Components imports
import Header from './components/static/Header';
import Footer from './components/static/Footer';
import Intro from './components/MainPage';

import Poke from './components/content/Pokedex';
import PokeList from './components/content/PokedexList';
import Berr from './components/content/Berries';
import Mach from './components/content/Machine';

class App extends Component {

  render() {
    return (
      <div className="App">
        <Header />
  
          <Router className="App-body">
            <Switch>
              <Route exact path = "/" component = {Intro} />
              <Route exact path = "/pokemon/page/:page" component = {PokeList} />
              <Route exact path = "/pokemon/:id" component = {Poke} />
              <Route exact path = "/berries" component = {Berr} />
              <Route exact path = "/machines" component = {Mach} />
            </Switch>
          </Router>

        <Footer />
      </div>
    );
  }
}

export default App;
