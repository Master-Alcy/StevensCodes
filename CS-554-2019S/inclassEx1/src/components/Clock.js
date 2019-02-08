import React, { Component } from 'react';
import './App.css';

class Clock extends Component {
    constructor(props) {
        super(props);
        this.state = {
            date: this.props.date,
            timeDiff: this.props.timeDiff,
            place: this.props.place
        };
    }
    componentDidMount() {
        this.timerID = setInterval(
            () => this.tick(),
            1000
        );
    }
  
    componentWillUnmount() {
        clearInterval(this.timerID);
    }
    
    tick() {
        this.setState({
          date: new Date()
        });
      }

    render() {

        return (
            <div>
                <h2>Place: {this.state.place}. Time: {this.state.date.toLocaleTimeString("en-US", {timeZone: this.state.place})}</h2>
            </div>
        );
    }
}

export default Clock;