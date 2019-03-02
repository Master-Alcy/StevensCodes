// React imports
import React, { Component } from 'react';
import {
    BrowserRouter as Router,
    Route,
    Switch
} from 'react-router-dom';
// Render imports
import './view/App.css';
// Components imports
import Intro from './components/MainPage';
// Static pages
import Header from './components/static/Header';
import Footer from './components/static/Footer';
import NotFound from './components/static/NotFound';
// functioning pages
import Poke from './components/content/Pokedex';
import PokeList from './components/content/PokedexList';
import Berr from './components/content/Berries';
import BerrList from './components/content/BerryList';
import Mach from './components/content/Machine';
import MachList from './components/content/MachineList';

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
              <Route exact path = "/berries/page/:page" component = {BerrList} />
              <Route exact path = "/berries/:id" component = {Berr} />
              <Route exact path = "/machines/page/:page" component = {MachList} />
              <Route exact path = "/machines/:id" component = {Mach} />
              <Route component= {NotFound} />
            </Switch>
          </Router>

        <Footer />
      </div>
    );
  }
}

export default App;
