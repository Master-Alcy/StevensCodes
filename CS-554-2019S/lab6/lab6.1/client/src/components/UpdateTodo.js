import React, { Component } from 'react';
import ApiService from "../ApiService";
import { Link } from 'react-router-dom';

class UpdateTodo extends Component{
    constructor(props){
        super(props);
        this.state = {
            title: "",
            userId: "",
            completed: undefined,
            todosList: [],
            updateTodoOp: undefined,
            Id: "",
            userList: []
        };
        this.handleChange = this.handleChange.bind(this);
        this.updateTodoSubmit = this.updateTodoSubmit.bind(this);
    }

    async componentDidMount() {
        try {
            const todos = await ApiService.getTodos();
            const users = await ApiService.getUsers();
            this.setState({todosList: todos});
            this.setState({userList: users});
        } catch (e) {
            console.error(`An error ${e.message} occured while loading todos`);
        }
    }

    handleChange(event) {
        this.setState({[event.target.name]: event.target.value});
    }

    async resetData(){
        try {
            const todos = await ApiService.getTodos();
            const users = await ApiService.getUsers();
            this.setState({todosList: todos});
            this.setState({userList: users});
        } catch (e) {
            console.error(`An error ${e.message} occured while loading todos`);
        }
    }

    async updateTodoSubmit(event) {
        event.preventDefault();
        try {
            const todoInfo = {
                id: this.state.Id,
                title: this.state.title,
                userId: this.state.userId,
                completed: this.state.completed==="true"?true:false
            };
            const todo = await ApiService.updataTodo(todoInfo);
            this.setState({updateTodoOp: JSON.stringify(todo.updateTodo)});
            this.setState({Id: undefined});
            await this.resetData();
        } catch (e) {
            console.error(`An error ${e.message} occured while update todo`);
        }
    }
    
    render(){
        let optionTodos = this.state.todosList.map((todosList,index) =>
                <option key={index+1}>{todosList.id}</option>
        );
        let optionUsers = this.state.userList.map((userList,index) =>
                <option key={index+1}>{userList.id}</option>
        );
        let result = null;
        let todo = null;
        if (this.state.updateTodoOp) {
            result =
            <div>
                <p>Todo has updated!</p>
                <p>{this.state.updateTodoOp}</p>
            </div>
        }
        if(this.state.Id) {
            todo = 
            <form onSubmit={this.updateTodoSubmit}>
                <label>
                    Title:
                    <input type="text" name="title" value={this.state.title} onChange={this.handleChange} />
                </label>
                <label>
                    UserId:
                    <select name="userId" value={this.state.userId} onChange={this.handleChange} >
                        <option value=''>Select UserId</option>
                        {optionUsers}
                    </select>
                </label>
                <label>
                    Completed:
                    <select name="completed" value={this.state.completed} onChange={this.handleChange} >
                        <option value=''>Select Status</option>
                        <option value = "true">True</option>
                        <option value = "false">False</option>
                    </select>
                </label>
                <label><input type="submit" value="Submit" /></label>
            </form>
        }

        return(
            <div>
                <br/><br/><br/>
                Please Choose the todo:
                <select name="Id" value={this.state.Id} onChange={this.handleChange} >
                    <option value=''>Select Todo</option>
                    {optionTodos}
                </select>

                <br/><br/><br/>
                {todo}
                {result}
                <br/><br/>
                <Link className="todo__linkback" to='/'>Back to Todos List</Link>
            </div>
        );
    }
}

export default UpdateTodo;