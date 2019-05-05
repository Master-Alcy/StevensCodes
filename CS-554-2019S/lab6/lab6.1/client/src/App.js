import React from "react";
import "./styles/style.css";
import UserListContainer from "./containers/UserListContainer";
import TodoListContainer from "./containers/TodoListContainer";
import {  Route, Switch } from 'react-router-dom';
import CreateTodo from "./components/CreateTodo";
import DeleteTodo from "./components/DeleteTodo";
import UpdateTodo from "./components/UpdateTodo";

const App = () => {
  return (
      <Switch>
        <Route exact path="/" component={UserListContainer} />
        <Route path="/todos/:userId" component={TodoListContainer} />
        <Route path="/createtodo" component={CreateTodo} />
        <Route path="/updateTodo" component={UpdateTodo}/>
        <Route path="/deleteTodo" component={DeleteTodo}/>
      </Switch>
  );
};

export default App;