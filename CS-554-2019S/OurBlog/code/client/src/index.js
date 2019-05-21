import React from 'react';
import ReactDOM from 'react-dom';

// / import its ApolloProvider component, and use it as a composing component around your App component
import { ApolloProvider, Query } from 'react-apollo';

/*The ApolloClient class is used to create the client instance, and the HttpLink and InMemoryCache are used for its mandatory configurations. 
First, you can create a configured HttpLink instance, which will be fed to the Apollo Client creation.*/
import { ApolloClient } from 'apollo-client';
import { HttpLink } from 'apollo-link-http';
import { InMemoryCache } from 'apollo-cache-inmemory';

import './index.css';
import App from './App';
import * as serviceWorker from './serviceWorker';

import gql from 'graphql-tag';

// The uri is a mandatory value to define the only GraphQL API endpoint used by the Apollo Client.
const BASE_URL = 'http://localhost:5555/graphql';


/*
he http link is a terminating link that fetches GraphQL results from a GraphQL endpoint over an http connection. 
The http link supports both POST and GET requests with the ability to change the http options on a per query basis. 
This can be used for authentication, persisted queries, dynamic uris, and other granular updates.
*/
let httpLink = new HttpLink({
	uri: BASE_URL,
	headers: {
		authorization: localStorage.getItem('token'),
	},
	onError: ({ networkError, graphQLErrors }) => {
		console.log('graphQLErrors', graphQLErrors);
		console.log('networkError', networkError);
	}
});

/*create the cache as the place where the data is managed in Apollo Client. 
The cache normalizes your data, caches requests to avoid duplicates, and makes it possible to read and write data to the cache. 
*/
const cache = new InMemoryCache();

cache.writeData({
	data: {
		isLoggedIn: !!localStorage.getItem('token')
	}
});

//Finally, you can use both instantiated configurations, the link and the cache, to create the instance of the Apollo Client
const client = new ApolloClient({
	link: httpLink,
	cache
});

const IS_LOGGED_IN = gql`
    query IsUserLoggedIn {
        isLoggedIn @client
    }
`;

ReactDOM.render(
	<ApolloProvider client={client}>
		<Query query={IS_LOGGED_IN}>
            {({ data }) => (
				<App isLoggedIn={data.isLoggedIn}/>
			)}
		</Query>
	</ApolloProvider>,
	document.getElementById('root')
);

if (module.hot) {
	module.hot.accept();
}

// If you want your app to work offline and load faster, you can change
// unregister() to register() below. Note this comes with some pitfalls.
// Learn more about service workers: https://bit.ly/CRA-PWA
serviceWorker.unregister();
