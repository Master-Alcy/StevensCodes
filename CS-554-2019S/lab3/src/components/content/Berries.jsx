import React, { Component } from 'react';
import { Link } from 'react-router-dom';
import axios from 'axios';

class Berry extends Component {
    constructor(props) {
        super(props);
        this.state = {
            data: undefined,
            loading: true
        };
    }

    componentDidMount() {
        this.getData();
    }

    async getData() {
        try {
            let idNum = this.props.match.params.id;
            const response = await axios.get(
                `https://pokeapi.co/api/v2/berry/${idNum}`
            );

            this.setState({
                data: response.data,
                loading: false
            });
        } catch (e) {
            console.log(`In getData(): ${e}`);
            window.location.replace("http://localhost:3000/NotFound");
        }
    }

    formateData(data) {
        if (!data) {
            return "No Data";
        }
      //   console.log(data);

        const flaArray = data.flavors.map((element, i) => {
            return <li key={i}>Flavor: {element.flavor.name}. Potency: {element.potency}</li>
        });

        return (
            <article>
            <h1>-----( {data.name} )-----</h1>
                <ol>
                    <li><h3>Firmness: {data.firmness.name}</h3></li>
                    <li>
                       <h3>Flavors:</h3>
                       <ul>{flaArray}</ul>
                    </li>
                    <li><h3>Growth Time: {data.growth_time}</h3></li>
                    <li><h3>Item: {data.item.name}</h3></li>
                    <li><h3>Max Harvest: {data.max_harvest}</h3></li>
                    <li><h3>Natural Gift Power: {data.natural_gift_power}</h3></li>
                    <li><h3>Natural Gift Type: {data.natural_gift_type.name}</h3></li>
                    <li><h3>Size: {data.size}</h3></li>
                    <li><h3>Smoothness: {data.smoothness}</h3></li>
                    <li><h3>Soil Dryness: {data.soil_dryness}</h3></li>
                </ol>
            </article>
        );
    }

    render() {
        let dynamicContent = null;
        let content = (
            <article>
                <h2>Api Test</h2>
                <ul>
                    <li><Link to="/pokemon/page/0">Pokemon</Link></li>
                    <li><Link to="/berries/page/0">Berry</Link></li>
                    <li><Link to="/machines/page/0">Machine</Link></li>
                </ul>
            </article>
        );

        if (this.state.loading) {
            dynamicContent = (
                <div className="App-body">
                    {content}
                    <h1>Loading</h1>
                </div>
            );
        } else {
            dynamicContent = (
                <div className="App-body">
                    {content}
                    {this.formateData(this.state.data)}
                </div>
            );
        }

        return dynamicContent;
    }
}

export default Berry;