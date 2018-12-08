import React, { Component } from 'react';
import { Segment, Header, Divider, Card, Button, Icon, List } from 'semantic-ui-react';

class StudentPage extends Component {
    render() {
        return (
            <Segment raised>
                <Segment stacked inverted color='teal'>
                    <Header size='tiny'>Guide</Header>
                    <List bulleted>
                        <List.Item>Find book has three functions. All will return all matched books</List.Item>
                        <List.Item>Check Record is implemented against sessionID, thus no input needed.</List.Item>
                        <List.Item>Profile is extra in proposal.</List.Item>
                    </List>
                </Segment>
                <Header size='medium'>Welcome Student</Header>
                <Divider />
                <Card.Group>
                    <Card>
                        <Card.Content header='Entry to Profile' />
                        <Card.Content description='This is an extra component in final proposal, not implemented yet!' />
                        <Card.Content extra >
                            <Icon name='question circle' />
                            <Button negative>Not Implemented</Button>
                        </Card.Content>
                    </Card>

                    <Card>
                        <Card.Content header='Find the book you want' />
                        <Card.Content description='Get book By ISBN, title, or key word' />
                        <Card.Content extra >
                            <Icon name='book' />
                            <Button positive as='a' href='/student/search'>Go Find Book</Button>
                        </Card.Content>
                    </Card>

                    <Card>
                        <Card.Content header='Check Your Record' />
                        <Card.Content description='It should show your rental records' />
                        <Card.Content extra >
                            <Icon name='list alternate' />
                            <Button positive as='a' href='/student/record'>My Record</Button>
                        </Card.Content>
                    </Card>
                </Card.Group>
            </Segment>
        )
    }
}

export default StudentPage;