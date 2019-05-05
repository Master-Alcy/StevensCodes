import React, { Component } from "react";
import { Mutation } from "react-apollo";
import ReactModal from "react-modal";
import queries from "../../queries";

ReactModal.setAppElement("#root");
const customStyles = {
  content: {
    top: "50%",
    left: "50%",
    right: "auto",
    bottom: "auto",
    marginRight: "-50%",
    transform: "translate(-50%, -50%)",
    width: "50%",
    border: "1px solid #28547a",
    borderRadius: "4px"
  }
};

class DeleteQuoteModal extends Component {
  constructor(props) {
    super(props);
    this.state = {
      showDeleteModal: this.props.isOpen,
      quote: this.props.deleteQuote
    };
    this.handleOpenDeleteModal = this.handleOpenDeleteModal.bind(this);
    this.handleCloseDeleteModal = this.handleCloseDeleteModal.bind(this);
    console.log(this.state.quote);
  }

  handleOpenDeleteModal() {
    this.setState({ showDeleteModal: true });
  }

  handleCloseDeleteModal() {
    this.setState({ showDeleteModal: false });
    this.props.handleClose(false);
  }

  render() {
    return (
      <div>
        {/*Add Employee Modal */}
        <ReactModal
          name="deleteModal"
          isOpen={this.state.showDeleteModal}
          contentLabel="Delete Quote"
          style={customStyles}
        >

        <Mutation
          mutation={queries.DELETE_QUOTE}
          update={(cache, { data: { deleteQuote } }) => {
            const { quotes } = cache.readQuery({
              query: queries.GET_ALL_QUOTES
            });
            cache.writeQuery({
              query: queries.GET_ALL_QUOTES,
              data: {
                quotes: quotes.filter(e => e.id !== this.state.quote.id)
              }
            });
          }}
        >
        
        {(deleteQuote, { data }) => (
          <div>
            <p>Are you sure you want to delete{" "}{this.state.quote.quote}?</p>
            <form 
              className="form" 
              id="delete-quote"
              onSubmit={e => {
                e.preventDefault();
                deleteQuote({
                  variables: {
                    id: this.state.quote.id
                  }
                });
                this.setState({ showDeleteModal: false });
                alert("Quote Deleted");
                this.props.handleClose();
              }}
            >
              <br/>
              <br/>
              <button className="button add-button" type="submit">Delete Quote</button>
            </form>
          </div>
        )}
        </Mutation>
        <br />
        <br />
        <button className="button cancel-button" onClick={this.handleCloseDeleteModal}>Cancel</button>
        </ReactModal>
      </div>
    );
  }
}

export default DeleteQuoteModal;
