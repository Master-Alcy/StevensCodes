import React, { Component } from 'react';

import Employees from './Employees';
import Employer from './Employer';

class App extends Component {
	constructor(props) {
        super(props);
        this.state={
            operation: undefined
        }
	}
	getemployees() {
		this.setState({operation: 1});
	}
	getemployer() {
		this.setState({operation: 2});
	}
	showemployees(e) {
		e.preventDefault();
        this.getemployees();
	}
	showemployer(e) {
		e.preventDefault();
		this.getemployer();
	}
	render() {
		
		let infor = null;
		if(this.state.operation === 1) {
			infor = <Employees />
		}
		else if(this.state.operation === 2) {
			infor = <Employer />
		}
		else {
			infor = null;
		}

		return (
		<div>
		<br/><br/><br/>
		<button onClick={(e)=>this.showemployees(e)}>Show Employees</button> 
		<button onClick={(e)=>this.showemployer(e)}>Show Employer</button>
        {infor}
		</div>
		);
	}
}

export default App;
