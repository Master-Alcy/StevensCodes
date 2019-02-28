import React, { Component } from 'react';
import axios from 'axios';

class PokedexList extends Component {
    constructor(props) {
        super(props);
        this.state = {
            data: undefined,
            loading: true
        };
    }

    componentWillMount() {
        this.getAllData();
    }

    async getAllData() {

        try {
            let pageNum = this.props.match.params.page;
            if (!pageNum) {
                pageNum = 0;
            }
            pageNum *= 20;
            const response = await axios.get(
                `https://pokeapi.co/api/v2/pokemon/?offset=${pageNum}}`
            );

            console.log(response);

            this.setState({
                data: response.data,
                loading: false
            });
        } catch (e) {
            console.log(`error ${e}`);
        }
    }

    render() {

        if (this.state.loading) {
            return (<p>Loading the Pokemon</p>);
        } else {
            return (
                JSON.stringify(this.state.data)
            );
        }
    }

    // render() {
    //    let body = null;
    //    const regex = /(<([^>]+)>)/gi;
    //    let summary =
    //       this.state.data && this.state.data.summary.replace(regex, '');
    //    if (this.state.loading) {
    //       body = (
    //          <div>
    //             <h1>Shows</h1>
    //             <br />
    //             Loading...
    //          </div>
    //       );
    //    } else if (this.state.error) {
    //       body = (
    //          <div>
    //             <h1>{this.state.error}</h1>
    //          </div>
    //       );
    //    } else {
    //       let img = null;
    //       if (this.state.data.image) {
    //          img = <img alt="Show" src={this.state.data.image.medium} />;
    //       } else {
    //          // img = <img alt="Show" src={noImage} />;
    //       }
    //       body = (
    //          <div>
    //             <h3 className="cap-first-letter">
    //                {this.state.data && this.state.data.name}
    //             </h3>
    //             {img}
    //             <br />
    //             <br />
    //             <p>
    //                Average Rating: {this.state.data.rating.average}
    //                <br />
    //                Network: {this.state.data.network && this.state.data.network.name} <br />
    //                Language: {this.state.data.language}
    //                <br />
    //                Runtime: {this.state.data.runtime}
    //                <br />
    //                Premiered: {this.state.data.premiered}
    //                <br />
    //             </p>
    //             <b>Genres</b>:
    //             <ul className="list-unstyled">
    //                {this.state.data.genres.map(genre => {
    //                   return <li key={genre}>{genre}</li>;
    //                })}
    //             </ul>
    //             <p>Summary: {summary}</p>
    //          </div>
    //       );
    //    }
    //    return body;
    // }
}

export default PokedexList;