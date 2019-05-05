import React, { Component } from 'react';
import ApiService from "../ApiService";
import { Link } from 'react-router-dom';

class CreateTodo extends Component{
    constructor(props){
        super(props);
        this.state = {
            title: "",
            userId: "",
            userList: [],
            createdTodo: undefined
        };
        this.handleChange = this.handleChange.bind(this);
        this.createTodoSubmit = this.createTodoSubmit.bind(this);
    }

    async componentDidMount() {
        try {
            const users = await ApiService.getUsers();
            this.setState({userList: users});
        } catch (e) {
            console.error(`An error ${e.message} occured while loading users`);
        }
    }

    handleChange(event) {
        this.setState({[event.target.name]: event.target.value});
    }

    async createTodoSubmit(event) {
        event.preventDefault();
        try {
            let todoInfo = {
                title: this.state.title,
                userId: this.state.userId
            };
            let todo = await ApiService.createTodo(todoInfo);
            this.setState({createdTodo: JSON.stringify(todo.createTodo)});
        } catch (e) {
            console.error(`An error ${e.message} occured while create todo`);
        }
    }

    render(){
        let optionItems = this.state.userList.map((userList,index) =>
                <option key={index+1}>{userList.id}</option>
        );
        let result = null;
        if (this.state.createdTodo) {
            result =
            <div>
                <p>New todo has added!</p>
                <p>{this.state.createdTodo}</p>
            </div>
        }

        return(
            <div>
                <br/><br/><br/>
                <form onSubmit={this.createTodoSubmit}>
                    <label>
                        Title:
                        <input type="text" name="title" value={this.state.title} onChange={this.handleChange} />
                    </label>
                    <label>
                        userId:
                        <select name="userId" value={this.state.userId} onChange={this.handleChange} >
                            <option value=''>Select UserId</option>
                            {optionItems}
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

export default CreateTodo;