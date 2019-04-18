import React, {
    Component
} from 'react';
import axios from 'axios';

class SearchShows extends Component {
    constructor(props) {
        super(props);
        this.state = {
            searchTerm: undefined,
            searchResult: undefined
         };
    }

    handleChange = (e) => {
        let value = e.target.value;
        this.setState({
            searchTerm: value
        }, () => {
            this.searchShows();
        });
    }

    async searchShows() {
        console.log('In search shows');
        console.log(this.state.searchTerm);

        if (this.state.searchTerm) {
            try {
                const response = await axios.get('http://api.tvmaze.com/search/shows?q=' + this.state.searchTerm);
                console.log(response);
                this.props.handleSearchState(this.state.searchTerm, response.data);
            } catch (e) {
                console.log(e);
            }
        } else {
            this.props.handleSearchState(undefined, undefined);
        }
    }

    render() {
        let form = (
            <div>
                <form method="POST " name="formName" onSubmit={this.onSubmit}>
                    <label>{' '}Search Term:
                    <input type="text" name="searchTerm"
                        onChange={this.handleChange}/>
                    </label>
                </form>
            </div>
        );
        return form;
    }
}

export default SearchShows;