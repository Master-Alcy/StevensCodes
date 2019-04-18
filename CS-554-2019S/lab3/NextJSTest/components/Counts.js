

class Counts extends React.Component {
    state = {
        currency: "Hello"
    }

    render() {
        console.log(this.props);

        return (
            <div>
                <ul className="list-group">
                    <li className="list-group-item">
                        Curent count is {this.props.num}
                    </li>
                </ul>
            </div>
        );
    }
}



export default Counts;