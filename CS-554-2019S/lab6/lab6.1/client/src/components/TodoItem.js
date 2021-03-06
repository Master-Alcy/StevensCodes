import React from "react";
import UserName from "./UserName";

const TodoItem = props => {
  const completedClass = props.completed ? "todo__item--completed" : "";
  console.log(completedClass)
  return (
    <div className={`todo__item ${completedClass}`}>
      <p className="todo__title">{props.title}
        <br/>
      </p>

      <div className="todo__assignee">
        <div className="todo__ulabel">Assigned To:</div>
        <UserName {...props.user} />
      </div>
    </div>
  );
};

export default TodoItem;
