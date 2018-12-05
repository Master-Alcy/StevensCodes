import React, { Component } from 'react';
import { Segment, Header, Divider, List, Input, Loader } from 'semantic-ui-react';

class StaffCheckBook extends Component {
    constructor() {
        super();
        this.handleChange = this.handleChange.bind(this);
        this.showResult = this.showResult.bind(this);
        this.showLoading = this.showLoading.bind(this);
        this.checkName = this.checkName.bind(this);

        this.state = {
            loading: false,
            results: [],
            title: ""
        }
        // results here is an array of objects
    }
    // Handle displayed values
    handleChange(event, { name, value }) {
        this.checkName(value);
        this.setState({ [name]: value });
    }

    checkName(value) {
        const title = value;
        const formdata = {
            title: title
        };

        // This is to rent router or receive router
        fetch("/book/search", {
            method: 'POST',
            headers: {
                'Content-type': 'application/json'
            },
            body: JSON.stringify(formdata)
        })
            .then((response) => response.json())
            .then((result) => {
                console.log(result);
                if (result.success) {
                    console.log("Record found");
                    console.log(result.data);
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
            for (let aBook in resultArray) {
                renderResult.push(<Divider horizontal>Book {++aBook}</Divider>);
                const thisRecord = resultArray[--aBook].record;
                for (let aRecord in thisRecord) {
                    renderResult.push(
                        <List.Item>
                            <Segment raised>
                                <Segment vertical>Student ID: &ensp;{thisRecord[aRecord].studentid}</Segment>
                                <Segment vertical>Action is : &ensp;{thisRecord[aRecord].action}</Segment>
                                <Segment vertical>Staff ID  &ensp;: &ensp;{thisRecord[aRecord].staffid}</Segment>
                                <Segment vertical>The date  &ensp;: &ensp;{thisRecord[aRecord].time}</Segment>
                            </Segment>
                        </List.Item>
                    );
                }
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
        const { title } = this.state;
        console.log(this.state);
        return (
            <Segment raised>
                <Header size='medium'>Our Library Check Book Record</Header>
                <Divider />

                <Segment raised>
                    <Header size='tiny'>Checking by Book Title</Header>
                    <Input fluid placeholder='Search title...'
                        name="title" icon='book' iconPosition='left'
                        value={title} onChange={this.handleChange} />
                    {this.showLoading()}

                </Segment>
                <Divider />

                {this.showResult()}
            </Segment>
        )
    }
}

export default StaffCheckBook;