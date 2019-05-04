import React, { Component } from "react";
import { Query } from "react-apollo";
import queries from "../queries";

import AddModal from "./modals/AddQuote";
import EditEmployeeModal from "./modals/UpdateQuote";
import DeleteEmployeeModal from "./modals/DeleteQuote";

class Quotes extends Component {

    constructor(props) {
      super(props);
      this.state = {
        showEditModal: false,
        showAddModal: false,
        showDeleteModal: false,
        editEmployee: null,
        deleteEmployee: null
      };
      this.handleOpenEditModal = this.handleOpenEditModal.bind(this);
      this.handleOpenAddModal = this.handleOpenAddModal.bind(this);
      this.handleCloseModals = this.handleCloseModals.bind(this);
    }

    handleOpenEditModal(employee) {
      this.setState({
        showEditModal: true,
        editEmployee: employee
      });
    }
  
    handleOpenDeleteModal(employee) {
      this.setState({
        showDeleteModal: true,
        deleteEmployee: employee
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
              
            {/*Edit Employee Modal - NOT DONE YET */}
    
            {/*Add Employee Modal */}

            {/*Delete Employee Modal */}
        </div>);
    }
}
  
export default Quotes;  