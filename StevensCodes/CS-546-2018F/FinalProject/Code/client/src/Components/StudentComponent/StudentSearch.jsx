import React, { Component } from 'react';
import { Segment, Header, Divider, List, Input, Loader } from 'semantic-ui-react';

class StudentSearch extends Component {
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
                    //console.log("Book found by title");
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
        const result = this.state.results;

        if (result.length > 0) {
            // Found by title gives array of profiles back
            let renderResult = [];
            for (let aBook in result) {
                renderResult.push(<Divider horizontal>Book {++aBook}</Divider>);
                const thisBook = result[--aBook];
                renderResult.push(
                    <List.Item>
                        <Segment raised>
                            <Segment vertical>Title &nbsp;  &ensp;:  &ensp;{thisBook.title}</Segment>
                            <Segment vertical>Edition :  &ensp;{thisBook.edition}</Segment>
                            <Segment vertical>ISBN &nbsp;  &ensp;:  &ensp;{thisBook.ISBN}</Segment>
                            <Segment vertical>Location:  &ensp;{thisBook.location}</Segment>
                            <Segment vertical>Price &nbsp;  &ensp;:  &ensp;{thisBook.price}</Segment>
                            <Segment vertical>Author  &ensp;:  &ensp;{thisBook.profile.author}</Segment>
                            <Segment vertical>
                                Description:  &ensp;
                                    {thisBook.profile.description}
                            </Segment>
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
        } else if (result.ISBN) {
            // Found by ISBN gives one profiles back
            // Or found an existing book not returned as list
            return (
                <Segment raised>
                    <Header size='medium'>Found Book</Header>
                    <List bulleted>
                        <List.Item>
                            <Segment raised>
                                <Segment vertical>Title &nbsp;  &ensp;:  &ensp;{result.title}</Segment>
                                <Segment vertical>Edition :  &ensp;{result.edition}</Segment>
                                <Segment vertical>ISBN &nbsp;  &ensp;:  &ensp;{result.ISBN}</Segment>
                                <Segment vertical>Location:  &ensp;{result.location}</Segment>
                                <Segment vertical>Price &nbsp;  &ensp;:  &ensp;{result.price}</Segment>
                                <Segment vertical>Author  &ensp;:  &ensp;{result.profile.author}</Segment>
                                <Segment vertical>Description:  &ensp;{result.profile.description}</Segment>
                            </Segment>
                        </List.Item>
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
        return (
            <Segment raised>
                <Header size='medium'>Our Library Check Book Record</Header>
                <Divider />

                <Segment raised>
                    <Header size='tiny'>Checking by Title</Header>
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

export default StudentSearch;