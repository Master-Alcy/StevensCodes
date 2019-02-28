import React, { Component } from 'react';
import logo from './logo.svg';
import './App.css';

class App extends Component {
  
  render() {
    return (
      <div className="App">
        <header className="App-header">
          <img src={logo} className="App-logo" alt="logo" />
          <h1>Learning React. This is lab3.</h1>
        </header>

        <body className="App-body">
          <h1>Api Test</h1>

        </body>

        <footer className="App-footer">
          <p>Jingxuan AI</p>
        </footer>
      </div>
    );
  }
}

export default App;
