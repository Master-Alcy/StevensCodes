import React, { Component } from 'react';
import { Image, Container, Divider, Segment, List, Icon, Table, Header, Grid } from 'semantic-ui-react';
import Cookies from 'universal-cookie';
const cookies = new Cookies();

class HomePage extends Component {
    componentDidMount() {
        if (cookies.get('student')) {
            cookies.remove('student');
        } else if (cookies.get('staff')) {
            cookies.remove('staff');
        }
    }

    render() {
        return (
            <div>
                <Segment stacked inverted color='teal'>
                    <Header size='tiny'>Guide</Header>
                    <List bulleted>
                        <List.Item>To test this website, please use the staff functions to Add/update books, rent/receive books, check book/student</List.Item>
                        <List.Item>Then use student account to search book and check his/her record</List.Item>
                        <List.Item>All Guides are added for testing helper.</List.Item>
                        <List.Item>Core design is all operation can only be performed as staff. Student can only search or check.</List.Item>
                        <List.Item>Home Page's news are all empty. Just to show we can add links there.</List.Item>
                    </List>
                </Segment>
                <Container textAlign='center'><h1>Home of Our Library</h1></Container>
                <Image src='public/Library-Wallpaper.png' fluid />
                <Container textAlign='justified'>
                    <Divider />
                    <Grid>
                        <Grid.Column width={12}>
                            <Header as='h2'>Library Hours</Header>
                            <Table fixed>
                                <Table.Header>
                                    <Table.Row>
                                        <Table.HeaderCell>Week</Table.HeaderCell>
                                        <Table.HeaderCell>Hours</Table.HeaderCell>
                                    </Table.Row>
                                </Table.Header>

                                <Table.Body>
                                    <Table.Row>
                                        <Table.Cell>Monday</Table.Cell>
                                        <Table.Cell>9:00 am ~ 11:00 pm</Table.Cell>
                                    </Table.Row>
                                    <Table.Row>
                                        <Table.Cell>TuesDay</Table.Cell>
                                        <Table.Cell>9:00 am ~ 11:00 pm</Table.Cell>
                                    </Table.Row>
                                    <Table.Row>
                                        <Table.Cell>Wednesday</Table.Cell>
                                        <Table.Cell>9:00 am ~ 11:00 pm</Table.Cell>
                                    </Table.Row>
                                    <Table.Row>
                                        <Table.Cell>Thursday</Table.Cell>
                                        <Table.Cell>9:00 am ~ 11:00 pm</Table.Cell>
                                    </Table.Row>
                                    <Table.Row>
                                        <Table.Cell>Friday</Table.Cell>
                                        <Table.Cell>9:00 am ~ 11:00 pm</Table.Cell>
                                    </Table.Row>
                                    <Table.Row>
                                        <Table.Cell>Saturday</Table.Cell>
                                        <Table.Cell>9:00 am ~ 11:00 pm</Table.Cell>
                                    </Table.Row>
                                    <Table.Row>
                                        <Table.Cell>Sunday</Table.Cell>
                                        <Table.Cell>9:00 am ~ 11:00 pm</Table.Cell>
                                    </Table.Row>
                                </Table.Body>
                            </Table>
                        </Grid.Column>

                        <Grid.Column floated='right' width={4}>
                            <Segment clearing>
                                <Icon name='newspaper' floated='left' />
                                <Header as='h4' floated='right'>News</Header>
                            </Segment>

                            <List bulleted link>
                                <List.Item as='a' href=''>Empty News 1</List.Item>
                                <List.Item as='a' href=''>Empty News 2</List.Item>
                                <List.Item as='a' href=''>Empty News 3</List.Item>
                            </List>
                        </Grid.Column>
                    </Grid>
                </Container>
            </div>
        )
    }
}

export default HomePage;