import React, { Component } from 'react';
import ApiService from "../ApiService";
import { Link } from 'react-router-dom';

class DeleteTodo extends Component{
    constructor(props){
        super(props);
        this.state = {
            todosList: [],
            Id: undefined,
            deleteTodoOp: undefined
        };
        this.handleChange = this.handleChange.bind(this);
        this.deleteTodoSubmit = this.deleteTodoSubmit.bind(this);
    }

    async componentDidMount() {
        try {
            const todos = await ApiService.getTodos();
            this.setState({todosList: todos});
        } catch (e) {
            console.error(`An error ${e.message} occured while loading todos`);
        }
    }

    async resetData(){
        try {
            const todos = await ApiService.getTodos();
            this.setState({todosList: todos});
        } catch (e) {
            console.error(`An error ${e.message} occured while loading todos`);
        }
    }

    handleChange(event) {
        this.setState({[event.target.name]: event.target.value});
    }

    async deleteTodoSubmit(event) {
        event.preventDefault();
        try {
            let todoInfo = {
                id: this.state.Id
            };
            let todo = await ApiService.deleteTodo(todoInfo);
            this.setState({deleteTodoOp: JSON.stringify(todo.deleteTodo)});
            this.setState({Id: undefined});
            await this.resetData();
        } catch (e) {
            console.error(`An error ${e.message} occured while delete todo`);
        }
    }

    render(){
        let optionTodos = this.state.todosList.map((todosList,index) =>
                <option key={index+1}>{todosList.id}</option>
        );
        let result = null;
        if (this.state.deleteTodoOp) {
            result = <div><p>Todo has deleted!</p></div>
        }

        return(
            <div><
                br/><br/><br/>
                <p>this is delete</p>
                <form onSubmit={this.deleteTodoSubmit}>
                    <label>
                        Please Choose the todo:
                        <select name="Id" value={this.state.Id} onChange={this.handleChange} >
                            <option value=''>Select Todo</option>
                            {optionTodos}
                        </select>
                    </label>
                    <label>
                        <input type="submit" value="Submit" />
                    </label>
                </form>
                <br/><br/><br/>
                {result}
                <br/><br/>
                <Link className="todo__linkback" to='/'>Back to Todos List</Link>
            </div>
        );
    }
}

export default DeleteTodo;