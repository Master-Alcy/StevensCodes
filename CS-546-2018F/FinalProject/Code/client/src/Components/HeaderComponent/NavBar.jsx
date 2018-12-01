import React, { Component } from 'react';
import { Header, Segment, Icon, List } from 'semantic-ui-react'

class NavBar extends Component {
    showNav() {
        if (window.location.pathname === "/student") {
            return (
                <List bulleted horizontal link>
                    <List.Item as='a' href='/'>Home</List.Item>
                    <List.Item as='a' href='/student'>Student Page</List.Item>
                </List>
            )
        } else if (window.location.pathname === "/staff") {
            return (
                <List bulleted horizontal link>
                    <List.Item as='a' href='/'>Home</List.Item>
                    <List.Item as='a' href='/staff'>Staff Page</List.Item>
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