import React from 'react';
import ApiService from '../ApiService';
import { Link } from 'react-router-dom';

class TodoListALL extends React.Component {
    constructor(props) {
        super(props);
        this.state = {
            todos: [],
        };
    }

    async componentDidMount() {
        try {
            const todos = await ApiService.getTodos();
            this.setState({todos});
        } catch (e) {
            console.error(`An error ${e.message} occured while loading todos`);
        }
    }

    render () {
        return (
           <div className="todo">
               <Link className="todo__linkback" to='/createtodo'>Create Todo</Link>
               <Link className="todo__linkback" to='/updatetodo'>Update Todo</Link>
               <Link className="todo__linkback" to='/deletetodo'>Delete Todo</Link>
           </div>
        );
    }
}

export default TodoListALL;