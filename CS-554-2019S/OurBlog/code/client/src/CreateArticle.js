import React, { Component } from "react";
import { Container } from 'react-bootstrap';

import NewArticle from "./forms/NewArticle";

class CreateArticle extends Component {
    render() {
        return (
            <div>
                <Container>
                    <NewArticle {...this.props}/>
                </Container>
            </div>
        );
    }
}

export default CreateArticle