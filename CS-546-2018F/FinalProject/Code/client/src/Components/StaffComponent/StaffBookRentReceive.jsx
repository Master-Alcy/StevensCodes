import React, { Component } from 'react';
import { Form, Segment, Icon, Header, Divider, List, Grid, Button } from 'semantic-ui-react';

class StaffBookRentReceive extends Component {
    constructor() {
        super();
        this.handleChange = this.handleChange.bind(this);
        this.chooseForm = this.chooseForm.bind(this);
        this.checkSubmit = this.checkSubmit.bind(this);
        this.handleSubmit = this.handleSubmit.bind(this);

        this.state = {
            isSubmitted: false,
            isWrong: false,
            message: "",
            chooseFormButton: "",

            ISBN: "",
            studentName: "",
            staffName: "",
            year: "",
            month: "",
            day: ""
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
                            href='http://localhost:3000/staff/bookinteraction'>
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
                            href='http://localhost:3000/staff/bookinteraction'>
                            Or Back
                        </Button>
                    </Segment>
                </div>
            );
        }

        return (<Form.Button>Submit</Form.Button>);
    }
    // Handle Update Book Submit
    handleSubmit() {
        event.preventDefault();
        const {
            chooseFormButton,
            ISBN,
            studentName,
            staffName,
            year,
            month,
            day
        } = this.state;
        // Note this is checked by require key word in HTML!
        // Here is for double check
        if (ISBN === "" || studentName === "" || staffName === ""
            || year === "" || month === "" || day === "" || chooseFormButton === "") {
            this.setState({
                isWrong: true,
                message: "All require fields must be filled!"
            });
            return;
        }
        let yearInfo, monthInfo, dayInfo, actionUrl;
        try {
            yearInfo = parseInt(year, 10);
            monthInfo = parseInt(month, 10);
            dayInfo = parseInt(day, 10);
        } catch (e) {
            this.setState({
                isWrong: true,
                message: "Date must be integers!"
            });
            return;
        }
        const dateInfo = new Date(yearInfo, (monthInfo - 1), dayInfo);
        const formdata = {
            ISBN: ISBN,
            studentName: studentName,
            staffName: staffName,
            time: dateInfo,
            action: chooseFormButton
        };

        // This is to rent router or receive router
        fetch("/book/changeRecord", {
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
                    //console.log("Rent/Receive Successed");
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
            ISBN,
            studentName,
            staffName,
            year,
            month,
            day
        } = this.state;
        // The rent out Form or the receive Form
        if (chooseFormButton !== "") {
            return (
                <Form onSubmit={this.handleSubmit}>
                    <Form.Field>
                        <Form.Input fluid label='ISBN' placeholder='ISBN' name="ISBN"
                            value={ISBN} onChange={this.handleChange} required />
                        <Form.Input fluid label='StudentName' placeholder='StudentName' name="studentName"
                            value={studentName} onChange={this.handleChange} required />
                        <Form.Input fluid label='StaffName' placeholder='StaffName' name="staffName"
                            value={staffName} onChange={this.handleChange} required />
                    </Form.Field>

                    <Form.Group unstackable widths={3}>
                        <Form.Input label='Year' placeholder='Year' name="year"
                            value={year} onChange={this.handleChange} required />
                        <Form.Input label='Month' placeholder='Month' name="month"
                            value={month} onChange={this.handleChange} required />
                        <Form.Input label='Day' placeholder='Day' name="day"
                            value={day} onChange={this.handleChange} required />
                    </Form.Group>

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
                                <Icon name='send' />
                                Rent Book Out
                                </Header>
                            <Button primary name='chooseFormButton' value='ren'
                                onClick={this.handleChange} >Rent</Button>
                        </Grid.Column>

                        <Grid.Column>
                            <Header icon>
                                <Icon name='box' />
                                Receive Book
                                </Header>
                            <Button primary name='chooseFormButton' value='rec'
                                onClick={this.handleChange} >Receive</Button>
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
                <Header size='medium'>Our Library Book Interaction</Header>
                <Divider />

                <Segment raised>
                    <Header size='tiny'>To operate records, you need following information</Header>
                    <List divided relaxed>
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
                                <List.Header >student's username</List.Header>
                                <List.Description >necessary, used to get its id</List.Description>
                            </List.Content>
                        </List.Item>

                        <List.Item>
                            <List.Icon name='dna' size='large' verticalAlign='middle' />
                            <List.Content>
                                <List.Header >staff's username</List.Header>
                                <List.Description >necessary, used to get its id</List.Description>
                            </List.Content>
                        </List.Item>

                        <List.Item>
                            <List.Icon name='dna' size='large' verticalAlign='middle' />
                            <List.Content>
                                <List.Header >action</List.Header>
                                <List.Description >necessary, choose from rent or receive</List.Description>
                            </List.Content>
                        </List.Item>

                        <List.Item>
                            <List.Icon name='dna' size='large' verticalAlign='middle' />
                            <List.Content>
                                <List.Header >time</List.Header>
                                <List.Description >necessary, in form of Date(year,month,day)</List.Description>
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

export default StaffBookRentReceive;