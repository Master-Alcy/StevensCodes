import React, { Component } from 'react';
import { Link } from 'react-router-dom';
import axios from 'axios';

class MachineList extends Component {
    constructor(props) {
        super(props);
        this.state = {
            data: undefined,
            machList: undefined,
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
            // console.log(pageNum);
            const initData = await axios.get(
                `https://pokeapi.co/api/v2/machine/?offset=${pageNum}`
            );
            // console.log(initData);

            let machData = [];
            for (let i = pageNum + 1; i <= pageNum + 20; i++) {
                const response = await axios.get(
                    `https://pokeapi.co/api/v2/machine/${i}/`
                );
                machData.push(response.data);
            }
            // console.log(machData);

            const maxNum = initData.data.count;
            if (pageNum < 0 || pageNum >= maxNum.count) {
                throw new Error(`Page Number ${pageNum} exceeds the limit`);
            }

            this.setState({
                data: initData.data,
                machList: machData,
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
                    <li><Link to={"/machines/page/" + nextNumber}>next</Link></li>
                </ul>
            );
        } else if (this.state.data.next === null && this.state.data.previous !== null) {
            return (
                <ul>
                    <li><Link to={"/machines/page/" + prevNumber}>prev</Link></li>
                </ul>
            );
        } else if (this.state.data.next !== null && this.state.data.previous !== null) {
            return (
                <ul>
                    <li><Link to={"/machines/page/" + nextNumber}>next</Link></li>
                    <li><Link to={"/machines/page/" + prevNumber}>prev</Link></li>
                </ul>
            );
        }
        return "error";
    }

    formateData(data) {
        if (!data) {
            return "No Data";
        }
        // console.log(data);

        const aList = data.map((element, i) => {
            // console.log(element.url.split("/")[6]);
            return (
                <li key={i}><Link to={"/machines/" + element.id}>
                    Item: {element.item.name}. Move: {element.move.name}. Version Group: {element.version_group.name}
                </Link></li>
            );
        });

        return (<ol>{aList}</ol>);
    }

    render() {
        let dynamicContent = null;
        let content = (
            <article>
                <h2>Machines</h2>
                <p>May take 2s to 10s to load.</p>
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
                    {this.formateData(this.state.machList)}
                </div>
            );
        }

        return dynamicContent;
    }
}

export default MachineList;