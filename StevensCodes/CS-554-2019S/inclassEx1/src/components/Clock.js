import React, { Component } from 'react';
import axios from 'axios';
import './App.css';

class Clock extends Component {
    constructor(props) {
        super(props);
        this.state = {
            date: this.props.date,
            place: this.props.place,
            weather: "Pending"
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
        }, () => {
            this.searchWeather();
        });
    }

    async searchWeather() {
        let res;
        console.log(this.state.place);

        if (this.state.place === "Australia/Brisbane") {
            res = await axios.get("api.openweathermap.org/data/2.5/weather?q=Brisbane&APPID=116b89114ecf4652f703510c4acbe6fc");
        }else if (this.state.place === "Asia/Shanghai") {
            res = await axios.get("api.openweathermap.org/data/2.5/weather?q=Shanghai&APPID=116b89114ecf4652f703510c4acbe6fc");
        }else if (this.state.place === "America/New_York") {
            res = await axios.get("api.openweathermap.org/data/2.5/weather?q=NewYork&APPID=116b89114ecf4652f703510c4acbe6fc");
        }
        // console.log(res);

        this.setState({
            weather: res
        });
        return;
    }

    render() {

        return (
            <div>
                <h2>Place: {this.state.place}. Time: {this.state.date.toLocaleTimeString("en-US", {timeZone: this.state.place})}</h2>
                <h3>Weather: {this.state.weather} </h3>
            </div>
        );
    }
}

export default Clock;