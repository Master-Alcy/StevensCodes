import React, { Component } from "react";
import { Query } from "react-apollo";
import queries from "../queries";

import AddQuoteModel from "./modals/AddQuote";
import UpdateQuoteModel from "./modals/UpdateQuote";
import DeleteQuoteModal from "./modals/DeleteQuote";

class Quotes extends Component {

    constructor(props) {
      super(props);
      this.state = {
        showEditModal: false,
        showAddModal: false,
        showDeleteModal: false,
        editQuote: null,
        deleteQuote: null
      };
      this.handleOpenEditModal = this.handleOpenEditModal.bind(this);
      this.handleOpenAddModal = this.handleOpenAddModal.bind(this);
      this.handleCloseModals = this.handleCloseModals.bind(this);
    }

    handleOpenEditModal(quote) {
      this.setState({
        showEditModal: true,
        editQuote: quote
      });
    }
  
    handleOpenDeleteModal(quote) {
      this.setState({
        showDeleteModal: true,
        deleteQuote: quote
      });
    }

    handleCloseModals() {
      this.setState({
        showAddModal: false,
        showEditModal: false,
        showDeleteModal: false
      });
    }
  
    handleOpenAddModal() {
      this.setState({ 
          showAddModal: true 
        });
    }

    render() {
      return (
        <div>
          <button className="button" onClick={this.handleOpenAddModal}>Create Quote</button>
          <br/>
          <br/>
          <Query query={queries.GET_ALL_QUOTES}>
          {({ data }) => {
            const { quotes } = data;
            if (!quotes) { return null; }
            return (
              <div>
              {quotes.map(quote => {
                  return (
                  <div className="card" key={quote.id}>
                    <div className="card-body">
                    <h5 className="card-title">{quote.id}</h5>
                    {quote.quote}
                    <br/>
                    <button className="button" onClick={() => { this.handleOpenEditModal(quote);}}>Edit</button>
                    <button className="button" onClick={() => { this.handleOpenDeleteModal(quote);}}>Delete</button>
                    <br/>
                    </div>
                  </div>);
                })}
              </div>);
            }}
            </Query>
              
            {this.state && this.state.showEditModal && (
              <UpdateQuoteModel
                isOpen={this.state.showEditModal}
                editQuote={this.state.editQuote}
                handleClose={this.handleCloseModals}
              />
            )}
    
            {this.state && this.state.showAddModal && (
              <AddQuoteModel
                isOpen={this.state.showAddModal}
                handleClose={this.handleCloseModals}
                modal="addQuote"
              />
            )}

            {this.state && this.state.showDeleteModal && (
              <DeleteQuoteModal
                isOpen={this.state.showDeleteModal}
                handleClose={this.handleCloseModals}
                deleteQuote={this.state.deleteQuote}
              />
            )}

        </div>);
    }
}
  
export default Quotes;  