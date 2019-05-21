import React, { Component } from "react";
import { withRouter } from "react-router";

import SignUpView from "./forms/SignUpView";

class SignUpContainer extends Component {
    handleSignUp = async event => {
        
    };

    render() {
        return <SignUpView onSubmit={this.handleSignUp} />;
    }
}

export default withRouter(SignUpContainer);