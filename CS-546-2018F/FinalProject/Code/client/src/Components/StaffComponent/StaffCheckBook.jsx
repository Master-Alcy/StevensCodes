import React, { Component } from 'react';
import { Segment, Header, Divider, List, Input, Loader } from 'semantic-ui-react';

class StaffCheckBook extends Component {
    constructor() {
        super();
        this.handleChange = this.handleChange.bind(this);
        this.showResult = this.showResult.bind(this);
        this.showLoading = this.showLoading.bind(this);
        this.checkName = this.checkName.bind(this);
        this.checkISBN = this.checkISBN.bind(this);
        this.checkKey = this.checkKey.bind(this);

        this.state = {
            loading: false,
            results: [],
            title: "",
            ISBN: "",
            keyWords: ""
        }
        // results here is an array of objects
    }
    // Handle displayed values
    handleChange(event, { name, value }) {
        if (name === "title") {
            this.checkName(value);
            this.setState({
                [name]: value,
                ISBN: "",
                keyWords: ""
            });
        } else if (name === "ISBN") {
            this.checkISBN(value);
            this.setState({
                [name]: value,
                title: "",
                keyWords: ""
            });
        } else {
            this.checkKey(value);
            this.setState({
                [name]: value,
                title: "",
                ISBN: ""
            });
        }
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
                //console.log(result);
                if (result.success) {
                    //console.log("Record found");
                    //console.log(result.data);
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

    checkISBN(value) {
        const ISBN = value;
        const formdata = {
            ISBN: ISBN
        };

        // This is to rent router or receive router
        fetch("/book/search/ISBN", {
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
                    //console.log("Book found by ISBN");
                    //console.log(result.data);
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

    checkKey(value) {
        const keyWords = value;
        const formdata = {
            key: keyWords
        };

        // This is to rent router or receive router
        fetch("/book/search/key", {
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
                    //console.log("Book found by key");
                    //console.log(result.data);
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
        if (!(this.state.ISBN === "" && this.state.keyWords === ""
            && this.state.title === "") && this.state.loading) {
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
                renderResult.push(
                    <List.Item>
                        <Segment raised>
                            <Segment vertical>Title &nbsp;  &ensp;:  &ensp;{resultArray[--aBook].title}</Segment>
                            <Segment vertical>Edition :  &ensp;{resultArray[aBook].edition}</Segment>
                            <Segment vertical>ISBN &nbsp;  &ensp;:  &ensp;{resultArray[aBook].ISBN}</Segment>
                            <Segment vertical>Location:  &ensp;{resultArray[aBook].location}</Segment>
                            <Segment vertical>Price &nbsp;  &ensp;:  &ensp;{resultArray[aBook].price}</Segment>
                            <Segment vertical>Storage &nbsp;:  &ensp;{resultArray[aBook].storage}</Segment>
                            <Segment vertical>TotStorage :  &ensp;{resultArray[aBook].totalStorage}</Segment>
                        </Segment>
                    </List.Item>
                );
                renderResult.push(<Divider horizontal>Record {++aBook}</Divider>);

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
                    <Header size='medium'>Found Book</Header>
                    <List bulleted>
                        {renderResult}
                    </List>
                </Segment>
            );
        } else if (resultArray.ISBN) {
            console.log(resultArray);
            let renderResult = [];
            renderResult.push(
                <List.Item>
                    <Segment raised>
                        <Segment vertical>Title &nbsp;  &ensp;:  &ensp;{resultArray.title}</Segment>
                        <Segment vertical>Edition :  &ensp;{resultArray.edition}</Segment>
                        <Segment vertical>ISBN &nbsp;  &ensp;:  &ensp;{resultArray.ISBN}</Segment>
                        <Segment vertical>Location:  &ensp;{resultArray.location}</Segment>
                        <Segment vertical>Price &nbsp;  &ensp;:  &ensp;{resultArray.price}</Segment>
                        <Segment vertical>Storage &nbsp;:  &ensp;{resultArray.storage}</Segment>
                        <Segment vertical>TotStorage :  &ensp;{resultArray.totalStorage}</Segment>
                    </Segment>
                </List.Item>
            );
            const thisRecord = resultArray.record;
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
            return (
                <Segment raised>
                    <Header size='medium'>Found Book</Header>
                    <List bulleted>
                        {renderResult}
                    </List>
                </Segment>
            );
        }
        return (
            <Segment raised>
                <Header size='medium'>No Book Found</Header>
            </Segment>
        );
    }

    render() {
        const { title, ISBN, keyWords } = this.state;
        //console.log(this.state);
        return (
            <Segment raised>
                <Header size='medium'>Our Library Check Book Record</Header>
                <Divider />

                <Segment raised>
                    <Header size='tiny'>Checking by Book Title</Header>
                    <Input fluid placeholder='Search title...'
                        name="title" icon='book' iconPosition='left'
                        value={title} onChange={this.handleChange} />
                </Segment>

                <Segment raised>
                    <Header size='tiny'>Checking by ISBN</Header>
                    <Input fluid placeholder='Search title...'
                        name="ISBN" icon='book' iconPosition='left'
                        value={ISBN} onChange={this.handleChange} />
                </Segment>

                <Segment raised>
                    <Header size='tiny'>Checking by Key Words</Header>
                    <Input fluid placeholder='Search title...'
                        name="keyWords" icon='book' iconPosition='left'
                        value={keyWords} onChange={this.handleChange} />
                </Segment>

                {this.showLoading()}
                <Divider />

                {this.showResult()}
            </Segment>
        )
    }
}

export default StaffCheckBook;