import React, { Component } from 'react';
import { Form, Segment, Radio, Icon, Header, Divider, List, Grid, Button } from 'semantic-ui-react';

class StaffBookAddRemove extends Component {
    constructor() {
        super();
        this.handleChange = this.handleChange.bind(this);
        this.chooseForm = this.chooseForm.bind(this);
        this.checkAddSubmit = this.checkAddSubmit.bind(this);
        this.checkUpdateSubmit = this.checkUpdateSubmit.bind(this);
        this.handleAddSubmit = this.handleAddSubmit.bind(this);
        this.handleUpdateSubmit = this.handleUpdateSubmit.bind(this);

        this.state = {
            isSubmitted: false,
            isInvalid: false,
            message: "",
            errors: "",
            
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
    checkAddSubmit() {




        if (this.state.isInvalid) {
            const msg = this.state.message;
            if (msg !== "") {
                return (
                    <div>
                        <Form.Button>Submit</Form.Button>
                        <Segment inverted color='red'>
                            <Icon loading name='spinner' />
                            {msg}
                        </Segment>
                    </div>
                );
            }
            return (
                <div>
                    <Form.Button>Submit</Form.Button>
                    <Segment inverted color='red'>
                        <Icon loading name='spinner' />
                        Invalid Input. Must finish all three fields.
                    </Segment>
                </div>
            );
        }
        if (this.state.isSubmitted) {
            return (
                <div>
                    <Segment inverted color='green'>
                        <Icon name='check' />
                        Valid Input. Submitted.
                    </Segment>
                </div>
            );
        } else {
            return (<Form.Button>Submit</Form.Button>);
        }
    }
    // Check Update Book Submit
    checkUpdateSubmit() {

    }
    // Handle Add Book Submit
    handleAddSubmit() {
        event.preventDefault();

        debugger;
        console.log(event.target);
        const formdata = {

        };
        return;
        // Signup is implemented as jquery's AJAX
        // This is the same thing but with fetch
        fetch('/user/login', {
            method: 'POST',
            headers: {
                'Content-type': 'application/json'
            },
            body: JSON.stringify(formdata)
        })
            .then((response) => response.json())
            .then((result) => {
                console.log(result);
                if (result.isFind) {
                    cookies.set(result.identity, result.sessionId, { path: '/' });
                    window.location.replace("http://localhost:3000/" + result.identity);
                } else {
                    this.setState({
                        isInvalid: true,
                        message: result.msg
                    });
                    return;
                }
            });

        if (!this.state.isSubmitted) {
            this.setState({
                isInvalid: false,
                isSubmitted: true
            });
        }
    }
    // Handle Update Book Submit
    handleUpdateSubmit() {

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
                    <Form.Input fluid label='Title' placeholder='Title' name="title" required />

                    <Form.Group unstackable widths={2}>
                        <Form.Input label='Storage' placeholder='Storage' name="storage" />
                        <Form.Input label='TotalStorage' placeholder='TotalStorage' name="totalStorage" />
                    </Form.Group>

                    <Form.Field>
                        <Form.Input fluid label='Author' placeholder='Author' name="author" />
                        <Form.Input fluid label='Tag' placeholder='Tag' name="tag" />
                        <Form.TextArea fluid label='Description' placeholder='Description' name="description" />
                    </Form.Field>

                    {this.checkUpdateSubmit()}
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
                        <Form.Input fluid label='Tag' placeholder='Tag' name="tag"
                            value={tag} onChange={this.handleChange} />
                        <Form.TextArea fluid label='Description' placeholder='Description' name="description"
                            value={description} onChange={this.handleChange} />
                    </Form.Field>

                    {this.checkAddSubmit()}
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
        console.log(this.state);

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
                                    necessary <strong>(NOTE: If adding to existing Book, ISBN must be correct.)</strong>
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