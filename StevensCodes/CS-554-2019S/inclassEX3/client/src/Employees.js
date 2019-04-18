import React from 'react';
//Import Query from react-apollo
import { Query } from 'react-apollo';
import gql from 'graphql-tag';

//The actual query
const GET_EMPLOYEES = gql`
	query {
		users {
			id
			name
			blogs {
				id
				content
			}
		}
	}
`;

/* The React Apollo package grants access to a Query component, which takes a query as prop and executes it when its rendered. 
That’s the important part: it executes the query when it is rendered. 
It uses React’s render props pattern, using a child as a function implementation where you can access the result of the query as an argument.
*/
const Employees = () => (
	<Query query={GET_EMPLOYEES}>
		{({ data }) => {
			const { users } = data;
			if (!users) {
				return null;
			}
			console.log(data);

			return (
				<div>
					<ul>
						<li>{JSON.stringify(users[0])}</li>
						<li>{JSON.stringify(users[1])}</li>
						<li>{JSON.stringify(users[2])}</li>
						<li>{JSON.stringify(users[3])}</li>
						<li>{JSON.stringify(users[4])}</li>
					</ul>
				</div>
			);
		}}
	</Query>
);

export default Employees;
