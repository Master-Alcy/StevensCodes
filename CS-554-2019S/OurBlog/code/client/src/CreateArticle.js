import React, { Component } from "react";
import { Container } from 'react-bootstrap';

import NewArticle from "./forms/NewArticle";

class CreateArticle extends Component {
<<<<<<< HEAD
=======
    constructor(props) {
        super(props);
    }
>>>>>>> 887ef9b15c5adc7dcec8b96530399b6466e77bc6
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