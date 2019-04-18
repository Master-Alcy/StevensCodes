import React, { Component } from 'react';
import axios from 'axios';
import { Link } from 'react-router-dom';
import SearchShows from './SearchShows';

class ShowList extends Component {
   constructor(props) {
      super(props);
      this.state = {
         data: undefined,
         loading: false,
         searchTerm: undefined,
         searchData: undefined
      };
   }

   async getShows() {
      try {
         const response = await axios.get('http://api.tvmaze.com/shows');
         this.setState({
            data: response.data
         });
      } catch (e) {
         console.log(e);
      }
   }

   componentDidMount() {
      this.getShows();
   }

   onSubmit(e) {
      e.preventDefault();
   }

   handleSearchState = (searchWord, searchResults) => {
      if (searchWord) {
         this.setState({searchTerm: searchWord, searchData: searchResults});
      } else {
         this.setState({searchTerm: undefined, searchData: undefined});
      }
   }

   render() {
      let body = null;
      let li = null;
      if (this.state.searchTerm) {
         li =
            this.state.searchData &&
            this.state.searchData.map(shows => {
               let show = shows.show;

               return (
                  <li key={show.id}>
                     <Link to={`/shows/${show.id}`}>{show.name}</Link>
                  </li>
               );
            });
      } else {
         li =
            this.state.data &&
            this.state.data.map(show => (
               <li key={show.id}>
                  <Link to={`/shows/${show.id}`}>{show.name}</Link>
               </li>
            ));
      }
      body = (
         <div>
            <SearchShows handleSearchState = {this.handleSearchState}/>
            <ul className="list-unstyled">{li}</ul>
         </div>
      );

      return body;
   }
}

export default ShowList;
