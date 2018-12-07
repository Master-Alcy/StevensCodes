import React, { Component } from 'react';
import { Segment, Header, Divider, List, Input, Loader } from 'semantic-ui-react';

class StaffCheckStudent extends Component {
    constructor() {
        super();
        this.handleChange = this.handleChange.bind(this);
        this.showResult = this.showResult.bind(this);
        this.showLoading = this.showLoading.bind(this);
        this.checkName = this.checkName.bind(this);

        this.state = {
            loading: false,
            results: [],
            studentName: ""
        }
        // results here is an array of objects
    }
    // Handle displayed values
    handleChange(event, { name, value }) {
        this.checkName(value);
        this.setState({ [name]: value });
    }

    checkName(value) {
        const studentName = value;
        const formdata = {
            studentName: studentName
        };

        // This is to rent router or receive router
        fetch("/user/search", {
            method: 'POST',
            headers: {
                'Content-type': 'application/json'
            },
            body: JSON.stringify(formdata)
        })
            .then((response) => response.json())
            .then((result) => {
                //console.log(result);
                if (result.success) {
                    //console.log("Record found");
                    this.setState({
                        loading: false,
                        results: result.data
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
        const { studentName } = this.state;
        //console.log(this.state);
        return (
            <Segment raised>
                <Header size='medium'>Our Library Check Student Record</Header>
                <Divider />

                <Segment raised>
                    <Header size='tiny'>Checking by student name</Header>
                    <Input fluid placeholder='Search student...'
                        name="studentName" icon='users' iconPosition='left'
                        value={studentName} onChange={this.handleChange} />
                    {this.showLoading()}

                </Segment>
                <Divider />

                {this.showResult()}
            </Segment>
        )
    }
}

export default StaffCheckStudent;