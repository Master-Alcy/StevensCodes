import React, { Component } from 'react';
import { Header, Segment, List, Icon } from 'semantic-ui-react'

class Footer extends Component {
    render() {
        return (
            <footer>
                <Segment clearing>
                    <Header as='h2' floated='right'>
                        <a href='https://github.com/CS546-Team/Library_System'>Team Github</a>
                    </Header>
                    <Header as='h6' floated='left'>
                        <Icon name='group' />
                        <List bulleted horizontal>
                            <List.Item>Jingxuan Ai</List.Item>
                            <List.Item>Ziang Lin</List.Item>
                            <List.Item>Ying Lu</List.Item>
                            <List.Item>Shuangwei Shi</List.Item>
                            <List.Item>Guanqin Zeng</List.Item>
                            <List.Item>Mingze Zhu</List.Item>
                        </List>
                    </Header>
                </Segment>
            </footer>
        )
    }
}

export default Footer;