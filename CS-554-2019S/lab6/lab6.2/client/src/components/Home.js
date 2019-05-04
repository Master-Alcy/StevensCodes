import React, { Component } from "react";
import "./App.css";

class Home extends Component {
  render() {
    return (
      <div className="card">
        <div className="card-body">
          <h5 className="card-title">GraphQL Demo</h5>
          <p className="cap-first-letter:first-letter">
            This is a demo of GraphQL using Express, Apollo Client and
            React
          </p>
          <p>
            It uses Express as the GraphQL server and Apollo Client and
            React as the client and demonstrates queries and mutations
          </p>
        </div>
      </div>
    );
  }
}

export default Home;
