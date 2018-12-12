import React from 'react';

export default class App extends React.Component{

  constructor(props) {
    super(props);
    this.render = this.render.bind(this);
    this.state = {
      items: this.props.items,
      disabled: true
    };
  }

  componentDidMount() {
    this.setState({
      disabled: false
    })
  }

  handleClick() {
    this.setState({
      items: this.state.items.concat('Item ' + this.state.items.length)
    })
  }

  render() {
    return (
      <div>
        asdsadas
        <a href="/api/book">book</a>
        <button onClick={this.handleClick.bind(this)} disabled={this.state.disabled}>Add Itemjlmlkmlkm </button>
        <ul>
        {
          this.state.items.map(function(item) {
            return <li>{item}</li>
          })
        }
        </ul>
      </div>
    )
  }
};
