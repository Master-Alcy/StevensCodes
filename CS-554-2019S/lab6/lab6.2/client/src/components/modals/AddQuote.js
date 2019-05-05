import React, { Component } from "react";
import { Query, Mutation } from "react-apollo";
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

class AddQuoteModal extends Component {
  constructor(props) {
    super(props);
    this.state = {
      showAddModal: this.props.isOpen
    };
    this.handleOpenAddModal = this.handleOpenAddModal.bind(this);
    this.handleCloseAddModal = this.handleCloseAddModal.bind(this);
  }

  handleOpenAddModal() {
    this.setState({ showAddModal: true });
  }

  handleCloseAddModal() {
    this.setState({ showAddModal: false });
    this.props.handleClose(false);
  }

  render() {
    let body;
    if (this.props.modal === "addQuote") {
      let quote;
      body = (
        <Mutation
          mutation={queries.ADD_QUOTE}
          update={(cache, { data: { createQuote } }) => {
            const { quotes } = cache.readQuery({
              query: queries.GET_ALL_QUOTES
            });
            cache.writeQuery({
              query: queries.GET_ALL_QUOTES,
              data: { quotes: quotes.concat([createQuote]) }
            });
          }}
        >
          {(createQuote, { data }) => (
            <form
              className="form"
              id="add-quote"
              onSubmit={e => {
                e.preventDefault();
                createQuote({
                  variables: {
                    quote: quote.value
                  }
                });
                quote.value = "";
                this.setState({ showAddModal: false });
                alert("Quote Added");
                this.props.handleClose();
              }}
            >
              <div className="form-group">
                <label>
                  Quote:
                  <br />
                  <input
                    ref={node => {
                      quote = node;
                    }}
                    required
                    autoFocus={true}
                  />
                </label>
              </div>
              <br />
              <button className="button add-button" type="submit">Add Quote</button>
            </form>
          )}
        </Mutation>);
    }

    return (
      <div>
        <ReactModal
          name="addModal"
          isOpen={this.state.showAddModal}
          contentLabel="Add Modal"
          style={customStyles}
        >
        {body}
        <button className="button cancel-button" onClick={this.handleCloseAddModal}>Cancel</button>
        </ReactModal>
      </div>);
  }
}

export default AddQuoteModal;
