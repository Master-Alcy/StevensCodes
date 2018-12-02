import React, { Component } from 'react';
import { Header, Segment, Icon, List } from 'semantic-ui-react'

class NavBar extends Component {
    showNav() {
        if (window.location.pathname === "/student" ||
            window.location.pathname === "/student/search" ||
            window.location.pathname === "/student/record") {
            return (
                <List bulleted horizontal link>
                    <List.Item as='a' href='/'>Home</List.Item>
                    <List.Item as='a' href='/student'>Student Page</List.Item>
                    <List.Item as='a' href='/student/search'>Search Book</List.Item>
                    <List.Item as='a' href='/student/record'>Check Rental Record</List.Item>
                </List>
            )
        } else if (window.location.pathname === "/staff" ||
            window.location.pathname === "/staff/bookstorage" ||
            window.location.pathname === "/staff/bookinteraction" ||
            window.location.pathname === "/staff/checkstudent" ||
            window.location.pathname === "/staff/checkbook") {
            return (
                <List bulleted horizontal link>
                    <List.Item as='a' href='/'>Home</List.Item>
                    <List.Item as='a' href='/staff'>Staff Page</List.Item>
                    <List.Item as='a' href='/staff/bookstorage'>Book Add/Remove</List.Item>
                    <List.Item as='a' href='/staff/bookinteraction'>Book Rent/Receive</List.Item>
                    <List.Item as='a' href='/staff/checkstudent'>Check Student Record</List.Item>
                    <List.Item as='a' href='/staff/checkbook'>Check Book Record</List.Item>
                </List>
            )
        } else {
            return (
                <List bulleted horizontal link>
                    <List.Item as='a' href='/'>Home</List.Item>
                    <List.Item as='a' href='/signup'>Sign Up</List.Item>
                    <List.Item as='a' href='/login'>Log In</List.Item>
                </List>
            )
        }
    }

    render() {
        return (
            <header>
                <Segment clearing>
                    <Header as='h2' floated='right'>
                        {this.showNav()}
                    </Header>
                    <Header as='h2' floated='left'>
                        <Icon name='university' />
                        <Header.Content>Our Library</Header.Content>
                    </Header>
                </Segment>
            </header>
        )
    }
}

export default NavBar;