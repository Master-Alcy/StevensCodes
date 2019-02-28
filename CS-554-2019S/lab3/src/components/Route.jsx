import React, { Component } from 'react';
import { Route, Switch } from 'react-router-dom';
import Mach from './content/Machine';
import Poke from './content/Pokedex';
import Berr from './content/Berries';
import Main from './MainPage';

class MyRouter extends Component {
    render() {
        return (
            <Switch>
                <Route exact path = "/" component = {Main}/>
                <Route exact path = "/pokemon" component = {Poke}/>
                <Route exact path = "/berries" component = {Berr}/>
                <Route exact path = "/machines" component = {Mach}/>
            </Switch>
        );
    }
}