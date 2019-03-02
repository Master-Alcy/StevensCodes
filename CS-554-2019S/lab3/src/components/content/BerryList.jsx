import React, { Component } from 'react';
import { Link } from 'react-router-dom';
import axios from 'axios';

class BerryList extends Component {
    constructor(props) {
        super(props);
        this.state = {
            data: undefined,
            oldNum: 0,
            loading: true
        };
    }

    componentDidMount() {
        this.getData();
    }

    componentDidUpdate() { // It took me 4 hours to find out this solution
        let currNum = this.props.match.params.page;
        currNum = parseInt(currNum);
        let oldNum = this.state.oldNum;
        oldNum = parseInt(oldNum);

        // console.log("DidUpdate, currNum = " + currNum);
        // console.log("DidUpdate, oldNum = " + this.state.oldNum);

        if (currNum === oldNum) {
            return;
        } else {
            this.getData();
        }
    }

    async getData() {
        try {
            let pageNum = this.props.match.params.page;
            if (!pageNum) {
                pageNum = 0;
            }
            pageNum *= 20;

            const response = await axios.get(
                `https://pokeapi.co/api/v2/berry/?offset=${pageNum}`
            );

            const maxNum = response.data.count;
            if (pageNum < 0 || pageNum >= maxNum) {
                throw new Error(`Page Number ${pageNum} exceeds the limit`);
            }

            this.setState({
                data: response.data,
                oldNum: pageNum / 20,
                loading: false
            });
        } catch (e) {
            console.log(`In getData(): ${e}`);
            window.location.replace("http://localhost:3000/NotFound");
        }
    }

    whereToGo() {
        let currentPageNumber = this.props.match.params.page;
        currentPageNumber = parseInt(currentPageNumber);
        const nextNumber = currentPageNumber + 1;
        const prevNumber = currentPageNumber - 1;

        if (this.state.data === undefined) {
            return "Initial State";
        } else if (this.state.data.next !== null && this.state.data.previous === null) {
            // console.log("at next !== null && prev === null, next=" + nextNumber);
            return (
                <ul>
                    <li><Link to={"/berries/page/" + nextNumber}>next</Link></li>
                </ul>
            );
        } else if (this.state.data.next === null && this.state.data.previous !== null) {
            return (
                <ul>
                    <li><Link to={"/berries/page/" + prevNumber}>prev</Link></li>
                </ul>
            );
        } else if (this.state.data.next !== null && this.state.data.previous !== null) {
            return (
                <ul>
                    <li><Link to={"/berries/page/" + nextNumber}>next</Link></li>
                    <li><Link to={"/berries/page/" + prevNumber}>prev</Link></li>
                </ul>
            );
        }
        return "error";
    }

    formateData(data) {
        if (!data) {
            return "No Data";
        }

        const aList = data.results.map((element, i) => {
            // console.log(element.url.split("/")[6]);
            return <li key={i}><Link to={"/berries/" + element.url.split("/")[6]}>{element.name}</Link></li>
        });

        return (<ol>{aList}</ol>);
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
                {this.whereToGo()}
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

export default BerryList;