import React, { Component } from "react";
import { withRouter } from "react-router";

import SignInView from "./forms/SignInView";

class SignInContainer extends Component {
    handleSignUp = async event => {
        
    };

    render() {
        return <SignInView onSubmit={this.handleSignIn} />;
    }
}

export default withRouter(SignInContainer);
