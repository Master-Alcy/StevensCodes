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

class EditQuoteModal extends Component {
  constructor(props) {
    super(props);
    this.state = {
      showEditModal: this.props.isOpen,
      quote: this.props.editQuote
    };
    this.handleCloseEditModal = this.handleCloseEditModal.bind(this);
  }

  handleCloseEditModal() {
    this.setState({ showEditModal: false, quote: null });
    this.props.handleClose();
  }

  render() {
    let quote;
    let id;
    return (
      <div>
        <ReactModal
          name="editModal"
          isOpen={this.state.showEditModal}
          contentLabel="Edit Quote"
          style={customStyles}
        >
          <Mutation mutation={queries.UPDATE_QUOTE}>
            {(updateQuote, { data }) => (
              <form
                className="form"
                id="update-quote"
                onSubmit={e => {
                  console.log(quote.value);
                  e.preventDefault();
                  updateQuote({
                    variables: {
                      id: this.state.quote.id,
                      quote: quote.value
                    }
                  });
                  this.setState({ showEditModal: false });
                  alert("Quote Updated");
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
                      defaultValue={this.props.quote}
                      autoFocus={true}
                    />
                  </label>
                </div>
                <br />
                <button className="button add-button" type="submit">Update Employee</button>
              </form>
            )}
          </Mutation>
          <button className="button cancel-button" onClick={this.handleCloseEditModal}>Cancel</button>
        </ReactModal>
      </div>);
  }
}

export default EditQuoteModal;
