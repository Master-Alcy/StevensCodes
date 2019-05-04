import gql from "graphql-tag";

const GET_ALL_QUOTES = gql`
  query {
    quotes {
      id
      quote
    }
  }
`;

const ADD_QUOTE = gql`
  mutation createQuote($quote: String!) {
    createQuote(input: { quote: $quote }) {
      id
      quote
    }
  }
`;

const DELETE_QUOTE = gql`
  mutation deleteQuote($id: String!) {
    deleteQuote(input: { id: $id }) {
      id
    }
  }
`;

const UPDATE_QUOTE = gql`
  mutation updateQuote($id: String!, $quote: String!) {
    updateQuote(input: { id: $id, quote: $quote}) {
      id
      quote
    }
  }
`;

export default {
  GET_ALL_QUOTES,
  ADD_QUOTE,
  DELETE_QUOTE,
  UPDATE_QUOTE
};
