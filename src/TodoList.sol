// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

contract TodoList {
    // Status options for todo items
    enum Status { Pending, InProgress, Completed }

    // Todo item structure
    struct Todo {
        uint id;
        string content;
        Status status;
    }

    // Storage for todos
    mapping(uint => Todo) public todos;
    uint[] public todoIds;
    uint public nextId;

    // Events
    event TodoAdded(uint id, string content);
    event TodoStatusUpdated(uint id, Status status);

    // Add a new todo item
    function addTodo(string memory _content) public {
        todos[nextId] = Todo(nextId, _content, Status.Pending);
        todoIds.push(nextId);
        emit TodoAdded(nextId, _content);
        nextId++;
    }

    // Update the status of a todo
    function updateStatus(uint _id, Status _status) public {
        require(_id < nextId, "Todo does not exist.");
        todos[_id].status = _status;
        emit TodoStatusUpdated(_id, _status);
    }

    // Get a specific todo by id
    function getTodo(uint _id) public view returns (uint, string memory, Status) {
        require(_id < nextId, "Todo does not exist.");
        Todo memory t = todos[_id];
        return (t.id, t.content, t.status);
    }

    // Get the total number of todos
    function getTodoCount() public view returns (uint) {
        return todoIds.length;
    }

    // Get all todo ids
    function getAllTodoIds() public view returns (uint[] memory) {
        return todoIds;
    }
}
