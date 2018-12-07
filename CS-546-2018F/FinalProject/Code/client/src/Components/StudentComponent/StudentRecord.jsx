import React, { Component } from 'react';
import { Segment, Header, Divider, List, Loader } from 'semantic-ui-react';
import Cookies from 'universal-cookie';
const cookies = new Cookies();

class StudentRecord extends Component {
    constructor() {
        super();
        this.showResult = this.showResult.bind(this);
        this.showLoading = this.showLoading.bind(this);

        this.state = {
            loading: false,
            results: []
        }
        // results here is an array of objects
    }

    componentDidMount() {
        // Note this cookie has to be found, or
        // The user won't be here in the first place
        const id = cookies.get("student");
        const formdata = {
            sessionId: id
        };
        fetch("/user/" + id, {
            method: 'POST',
            headers: {
                'Content-type': 'application/json'
            },
            body: JSON.stringify(formdata)
        })
            .then((response) => response.json())
            .then((result) => {
                //console.log(result);
                if (result.isFind) {
                    //console.log("Record found");
                    this.setState({
                        loading: false,
                        results: result.record
                    });
                } else {
                    this.setState({
                        loading: true,
                        results: []
                    });
                }
            });
    }

    showLoading() {
        if (this.state.loading) {
            return (
                <Loader inline='centered' active size='huge' >
                    Would Stay <strong>Loading</strong> for Invalid Input
                </Loader>
            );
        }
    }

    showResult() {
        const resultArray = this.state.results;

        if (resultArray.length > 0) {
            let renderResult = [];
            for (let aRecord in resultArray) {
                renderResult.push(
                    <List.Item>
                        <Segment raised>
                            <Segment vertical>Book ID : &ensp;{resultArray[aRecord].bookid}</Segment>
                            <Segment vertical>Action  &ensp;: &ensp;{resultArray[aRecord].action}</Segment>
                            <Segment vertical>Staff ID: &ensp;{resultArray[aRecord].staffid}</Segment>
                            <Segment vertical>At date : &ensp;{resultArray[aRecord].time}</Segment>
                        </Segment>
                    </List.Item>
                );
            }
            return (
                <Segment raised>
                    <Header size='medium'>Found Record</Header>
                    <List bulleted>
                        {renderResult}
                    </List>
                </Segment>
            );
        }
        return (
            <Segment raised>
                <Header size='medium'>No Record</Header>
            </Segment>
        );
    }

    render() {
        //console.log(this.state);
        return (
            <Segment raised>
                <Header size='medium'>Find Your Record</Header>
                <Divider />

                <Segment raised>
                    <Header size='tiny'>Checking by sessionId</Header>
                    {this.showLoading()}
                </Segment>
                <Divider />

                {this.showResult()}
            </Segment>
        )
    }
}

export default StudentRecord;