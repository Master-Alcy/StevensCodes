import React, { Component } from 'react';
import { Image, Container, Divider, Segment, List, Icon, Table, Header, Grid } from 'semantic-ui-react';

class HomePage extends Component {
    render() {
        return (
            <div>
                <Container textAlign='center'><h1>Home page</h1></Container>
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