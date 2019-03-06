import React, { Component } from 'react';
import { Link } from 'react-router-dom';
import axios from 'axios';

class Pokedex extends Component {
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
                `https://pokeapi.co/api/v2/pokemon/${idNum}`
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
        // console.log(data);

        const abilitiesArray = data.abilities.map((element, i) => {
            return <li key={i}>{element.ability.name}</li>
        });
        const formArray = data.forms.map((element, i) => {
            return <li key={i}>{element.name}</li>
        });
        const typeArray = data.types.map((element, i) => {
            return <li key={i}>{element.type.name}</li>
        });
        const statArray = data.stats.map((element, i) => {
            return <li key={i}>{element.stat.name}: {element.base_stat}</li>
        });

        let img = undefined;
        if (this.state.data.sprites.front_default) {
            img = <img alt="Pokemon" src={this.state.data.sprites.front_default} />;
        } else {
            img = <p>No Image</p>
        }

        return (
            <article>
                <h2>-----( {data.name} )-----</h2>
                {img}
                <ol>
                    <li>
                        <h3>Abilities:</h3>
                        <ul>{abilitiesArray}</ul>
                    </li>
                    <li><h3>Base experience: {data.base_experience}</h3></li>
                    <li>
                        <h3>Forms:</h3>
                        <ul>{formArray}</ul>
                    </li>
                    <li><h3>Height: {data.height}</h3></li>
                    <li><h3>Species: {data.species.name}</h3></li>
                    <li>
                        <h3>Base stat:</h3>
                        <ul>{statArray}</ul>
                    </li>
                    <li>
                        <h3>Type:</h3>
                        <ul>{typeArray}</ul>
                    </li>
                    <li><h3>Weight: {data.weight}</h3></li>
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

export default Pokedex;