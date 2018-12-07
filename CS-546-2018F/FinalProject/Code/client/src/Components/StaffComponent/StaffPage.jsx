import React, { Component } from 'react';
import { Segment, Header, Divider, Card, Button } from 'semantic-ui-react';

class StaffPage extends Component {
    render() {
        return (
            <Segment raised>
                <Segment stacked inverted color='teal'>
                    <Header size='tiny'>Guide</Header>
                    <List bulleted>
                        <List.Item>A book should only be rented by a staff. Use the Book Rental and Return Section</List.Item>
                        <List.Item>For new book arrives, staff can use Book Addition and Update.</List.Item>
                        <List.Item>Check Student and Check Book are self explained</List.Item>
                    </List>
                </Segment>
                <Header size='medium'>Welcome Staff At Our Library</Header>
                <Divider />
                <Card.Group>
                    <Card>
                        <Card.Content>
                            <Card.Header>Book Addition and Update</Card.Header>
                            <Card.Meta>Staff Only</Card.Meta>
                            <Card.Description>This is where to <strong>add/update</strong> books.</Card.Description>
                        </Card.Content>
                        <Card.Content extra>
                            <Button basic color='green' as='a' href='staff/bookstorage'>Bookstorage</Button>
                        </Card.Content>
                    </Card>

                    <Card>
                        <Card.Content>
                            <Card.Header>Book Rental and Return</Card.Header>
                            <Card.Meta>Staff Only</Card.Meta>
                            <Card.Description>This is where to <strong>rent/receive</strong> books.</Card.Description>
                        </Card.Content>
                        <Card.Content extra>
                            <Button basic color='green' as='a' href='staff/bookinteraction'>Bookinteraction</Button>
                        </Card.Content>
                    </Card>

                    <Card>
                        <Card.Content>
                            <Card.Header>Check Student</Card.Header>
                            <Card.Meta>Staff Only</Card.Meta>
                            <Card.Description>Check a student's rental record</Card.Description>
                        </Card.Content>
                        <Card.Content extra>
                            <Button basic color='green' as='a' href='staff/checkstudent'>Checkstudent</Button>
                        </Card.Content>
                    </Card>

                    <Card>
                        <Card.Content>
                            <Card.Header>Check Book</Card.Header>
                            <Card.Meta>Staff Only</Card.Meta>
                            <Card.Description>Check a book's data</Card.Description>
                        </Card.Content>
                        <Card.Content extra>
                            <Button basic color='green' as='a' href='staff/checkbook'>Checkbook</Button>
                        </Card.Content>
                    </Card>
                </Card.Group>
            </Segment>
        )
    }
}

export default StaffPage;