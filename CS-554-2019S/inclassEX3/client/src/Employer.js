import React from 'react';
//Import Query from react-apollo
import { Query } from 'react-apollo';
import gql from 'graphql-tag';

//The actual query
const GET_EMPLOYER = gql`
	query {
		blogs {
			id
			content
		}
	}
`;

/* The React Apollo package grants access to a Query component, which takes a query as prop and executes it when its rendered. 
That’s the important part: it executes the query when it is rendered. 
It uses React’s render props pattern, using a child as a function implementation where you can access the result of the query as an argument.
*/
const Employer = () => (
	<Query query={GET_EMPLOYER}>
		{({ data }) => {
			const { blogs } = data;
			if (!blogs) {
				return null;
			}
			console.log(data);

			return (
				<div>
					<ul>
						{data.blogs.map((blogs) => {
							return (
								<li key={blogs.id}>
									<p>{blogs.id}</p>
									<p>{blogs.content}</p>
								</li>
							);
						})}
					</ul>
				</div>
			);
		}}
	</Query>
);

export default Employer;
