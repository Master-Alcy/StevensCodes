import React, { Component } from 'react';
import { Form, Segment, Icon, Header, Divider, List, Grid, Button } from 'semantic-ui-react';

class StaffBookAddRemove extends Component {
    constructor() {
        super();
        this.handleChange = this.handleChange.bind(this);
        this.chooseForm = this.chooseForm.bind(this);
        this.checkSubmit = this.checkSubmit.bind(this);
        this.handleAddSubmit = this.handleAddSubmit.bind(this);
        this.handleUpdateSubmit = this.handleUpdateSubmit.bind(this);

        this.state = {
            isSubmitted: false,
            isWrong: false,
            message: "",
            chooseFormButton: "",

            title: "",
            edition: "",
            storage: "",
            totalStorage: "",
            location: "",
            price: "",
            ISBN: "",
            author: "",
            description: "",
            tag: ""
        };
    }
    // Handle displayed values
    handleChange(event, { name, value }) { this.setState({ [name]: value }); }
    // Check Add Book Submit
    checkSubmit() {
        if (this.state.isWrong) {
            const msg = this.state.message;
            return (
                <div>
                    <Form.Button>Submit Again</Form.Button>
                    <Segment inverted color='red'>
                        <Icon loading name='spinner' />
                        {msg}
                        <Button color='red' as='a'
                            href='http://localhost:3000/staff/bookstorage'>
                            Or Back
                        </Button>
                    </Segment>
                </div>
            );
        }
        if (this.state.isSubmitted) {
            return (
                <div>
                    <Form.Button>Another Submit</Form.Button>
                    <Segment inverted color='green'>
                        <Icon name='check' />
                        Valid Input. Submitted.
                        <Button color='green' as='a'
                            href='http://localhost:3000/staff/bookstorage'>
                            Or Back
                        </Button>
                    </Segment>
                </div>
            );
        }

        return (<Form.Button>Submit</Form.Button>);
    }
    // Handle Add Book Submit
    handleAddSubmit() {
        event.preventDefault();
        // Note this is checked by require key word in HTML!
        // Here is for double check
        if (this.state.title === "" || this.state.storage === "" || this.state.totalStorage === ""
            || this.state.edition === "" || this.state.ISBN === "") {
            this.setState({
                isWrong: true,
                message: "All require fields must be filled!"
            });
            return;
        }
        let storeInfo, editionInfo, totStoreInfo, priceInfo;
        try {
            storeInfo = parseInt(this.state.storage, 10);
            editionInfo = parseInt(this.state.edition, 10);
            totStoreInfo = parseInt(this.state.totalStorage, 10);
            priceInfo = parseInt(this.state.price, 10);
        } catch (e) {
            this.setState({
                isWrong: true,
                message: "edition, storage, totalStorage and price must be integers!"
            });
            return;
        }

        const formdata = {
            title: this.state.title,
            edition: editionInfo,
            storage: storeInfo,
            totalStorage: totStoreInfo,
            location: this.state.location,
            price: priceInfo,
            ISBN: this.state.ISBN,
            profile: {
                author: this.state.author,
                description: this.state.description,
                tag: this.state.tag.split(' '),
            }
        };

        fetch('/book/add', {
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
                    //console.log("Add Book Success");
                    this.setState({
                        isWrong: false,
                        isSubmitted: true
                    });
                } else {
                    this.setState({
                        isWrong: true,
                        message: result.msg
                    });
                }
            });
    }
    // Handle Update Book Submit
    handleUpdateSubmit() {
        event.preventDefault();
        // Note this is checked by require key word in HTML!
        // Here is for double check
        if (this.state.ISBN === "" || this.state.storage === ""
            || this.state.totalStorage === "") {
            this.setState({
                isWrong: true,
                message: "All require fields must be filled!"
            });
            return;
        }
        let storeInfo, totStoreInfo;
        try {
            storeInfo = parseInt(this.state.storage, 10);
            totStoreInfo = parseInt(this.state.totalStorage, 10);
        } catch (e) {
            this.setState({
                isWrong: true,
                message: "Storage must be integers!"
            });
            return;
        }

        const formdata = {
            ISBN: this.state.ISBN,
            storage: storeInfo,
            totalStorage: totStoreInfo,
            profile: {
                author: this.state.author,
                description: this.state.description,
                tag: this.state.tag.split(' ')
            }
        };

        fetch('/book/update', {
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
                    //console.log("Update Successed");
                    this.setState({
                        isWrong: false,
                        isSubmitted: true
                    });
                } else {
                    this.setState({
                        isWrong: true,
                        message: result.msg
                    });
                }
            });
    }
    // Handle rendered elements
    chooseForm() {
        const {
            chooseFormButton,
            title,
            edition,
            storage,
            totalStorage,
            location,
            price,
            ISBN,
            author,
            description,
            tag
        } = this.state;
        // The Update Form
        if (chooseFormButton === "upd") {
            return (
                <Form onSubmit={this.handleUpdateSubmit}>
                    <Form.Field>
                        <Form.Input fluid label='ISBN' placeholder='ISBN' name="ISBN" required
                            value={ISBN} onChange={this.handleChange} />
                    </Form.Field>

                    <Form.Group unstackable widths={2}>
                        <Form.Input label='Storage' placeholder='Storage' name="storage"
                            value={storage} onChange={this.handleChange} required />
                        <Form.Input label='TotalStorage' placeholder='TotalStorage' name="totalStorage"
                            value={totalStorage} onChange={this.handleChange} required />
                    </Form.Group>

                    <Form.Field>
                        <Form.Input fluid label='Author' placeholder='Author' name="author"
                            value={author} onChange={this.handleChange} />
                        <Form.Input fluid label='Tag' placeholder='Tags should be seperated with one space' name="tag"
                            value={tag} onChange={this.handleChange} />
                        <Form.TextArea fluid label='Description' placeholder='Description' name="description"
                            value={description} onChange={this.handleChange} />
                    </Form.Field>

                    {this.checkSubmit()}
                </Form>
            );
        }
        // The Add Book Form
        if (chooseFormButton === "add") {
            return (
                <Form onSubmit={this.handleAddSubmit}>
                    <Form.Group unstackable widths={3}>
                        <Form.Input label='Title' placeholder='Title' name="title"
                            value={title} onChange={this.handleChange} required />
                        <Form.Input label='Storage' placeholder='Storage' name="storage"
                            value={storage} onChange={this.handleChange} required />
                        <Form.Input label='TotalStorage' placeholder='TotalStorage' name="totalStorage"
                            value={totalStorage} onChange={this.handleChange} required />
                    </Form.Group>

                    <Form.Group unstackable widths={3}>
                        <Form.Input label='Edition' placeholder='Edition' name="edition"
                            value={edition} onChange={this.handleChange} required />
                        <Form.Input label='Location' placeholder='Location' name="location"
                            value={location} onChange={this.handleChange} />
                        <Form.Input label='Price' placeholder='Price' name="price"
                            value={price} onChange={this.handleChange} />
                    </Form.Group>

                    <Form.Field>
                        <Form.Input fluid label='ISBN' placeholder='ISBN' name="ISBN" required
                            value={ISBN} onChange={this.handleChange} />
                        <Form.Input fluid label='Author' placeholder='Author' name="author"
                            value={author} onChange={this.handleChange} />
                        <Form.Input fluid label='Tag' placeholder='Tags should be seperated with one space' name="tag"
                            value={tag} onChange={this.handleChange} />
                        <Form.TextArea fluid label='Description' placeholder='Description' name="description"
                            value={description} onChange={this.handleChange} />
                    </Form.Field>

                    {this.checkSubmit()}
                </Form>
            );
        }
        // The Switcher Before Choose
        return (
            <Segment placeholder>
                <Grid columns={2} stackable textAlign='center'>
                    <Divider vertical>Or</Divider>

                    <Grid.Row verticalAlign='middle'>
                        <Grid.Column>
                            <Header icon>
                                <Icon name='add square' />
                                Add new book
                                </Header>
                            <Button primary name='chooseFormButton' value='add'
                                onClick={this.handleChange} >Add</Button>
                        </Grid.Column>

                        <Grid.Column>
                            <Header icon>
                                <Icon name='book' />
                                Update existing Book
                                </Header>
                            <Button primary name='chooseFormButton' value='upd'
                                onClick={this.handleChange} >Update</Button>
                        </Grid.Column>
                    </Grid.Row>
                </Grid>
            </Segment>
        );
    }

    render() {
        //console.log(this.state);

        return (
            <Segment raised>
                <Header size='medium'>Our Library Book Storage</Header>
                <Divider />

                <Segment raised>
                    <Header size='tiny'>A startard Book has the following information</Header>
                    <List divided relaxed>
                        <List.Item>
                            <List.Icon name='dna' size='large' verticalAlign='middle' />
                            <List.Content>
                                <List.Header>title</List.Header>
                                <List.Description>necessary</List.Description>
                            </List.Content>
                        </List.Item>

                        <List.Item>
                            <List.Icon name='dna' size='large' verticalAlign='middle' />
                            <List.Content>
                                <List.Header >edition</List.Header>
                                <List.Description >necessary</List.Description>
                            </List.Content>
                        </List.Item>

                        <List.Item>
                            <List.Icon name='dna' size='large' verticalAlign='middle' />
                            <List.Content>
                                <List.Header >storage</List.Header>
                                <List.Description >necessary, describes the current storage in this library</List.Description>
                            </List.Content>
                        </List.Item>

                        <List.Item>
                            <List.Icon name='dna' size='large' verticalAlign='middle' />
                            <List.Content>
                                <List.Header >totalStorage</List.Header>
                                <List.Description >necessary, describes the total storage stored in all libraries</List.Description>
                            </List.Content>
                        </List.Item>

                        <List.Item>
                            <List.Icon name='dna' size='large' verticalAlign='middle' />
                            <List.Content>
                                <List.Header >location</List.Header>
                                <List.Description >un-necessary, describes which library this book is stored</List.Description>
                            </List.Content>
                        </List.Item>

                        <List.Item>
                            <List.Icon name='dna' size='large' verticalAlign='middle' />
                            <List.Content>
                                <List.Header >price</List.Header>
                                <List.Description >un-necessary</List.Description>
                            </List.Content>
                        </List.Item>

                        <List.Item>
                            <List.Icon name='dna' size='large' verticalAlign='middle' />
                            <List.Content>
                                <List.Header >ISBN</List.Header>
                                <List.Description >
                                    necessary <strong>(NOTE: Using ISBN to check if book exist already)</strong>
                                </List.Description>
                            </List.Content>
                        </List.Item>

                        <List.Item>
                            <List.Icon name='dna' size='large' verticalAlign='middle' />
                            <List.Content>
                                <List.Header >profile</List.Header>
                                <List.Description >un-necessary, describes this book's author, description, and array of tags.</List.Description>
                            </List.Content>
                        </List.Item>

                        <List.Item>
                            <List.Icon name='dna' size='large' verticalAlign='middle' />
                            <List.Content>
                                <List.Header >record</List.Header>
                                <List.Description >necessary, describes array of action id, studentid, action type, action time, and staffid</List.Description>
                            </List.Content>
                        </List.Item>
                    </List>
                </Segment>
                <Divider />

                {this.chooseForm()}
            </Segment>
        );
    }
}

export default StaffBookAddRemove;