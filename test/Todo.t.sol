// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "../src/TodoList.sol";

contract TodoListTest is Test {
    TodoList todo;
    
    // Define the events here to use in expectEmit
    event TodoAdded(uint id, string content);
    event TodoStatusUpdated(uint id, TodoList.Status status);

    function setUp() public {
        todo = new TodoList();
    }

    function testAddTodo() public {
        todo.addTodo("Buy milk");

        (uint id, string memory content, TodoList.Status status) = todo.getTodo(0);
        assertEq(id, 0);
        assertEq(content, "Buy milk");
        assertEq(uint(status), uint(TodoList.Status.Pending));
    }

    function testUpdateStatus() public {
        todo.addTodo("Do laundry");
        todo.updateStatus(0, TodoList.Status.Completed);

        (, , TodoList.Status status) = todo.getTodo(0);
        assertEq(uint(status), uint(TodoList.Status.Completed));
    }

    function testTodoIds() public {
        todo.addTodo("One");
        todo.addTodo("Two");

        uint id1 = todo.todoIds(0);
        uint id2 = todo.todoIds(1);

        assertEq(id1, 0);
        assertEq(id2, 1);
    }

    function testRevertWhenUpdatingNonExistentTodo() public {
        vm.expectRevert("Todo does not exist.");
        todo.updateStatus(42, TodoList.Status.Completed);
    }

    function testRevertWhenGettingNonExistentTodo() public {
        vm.expectRevert("Todo does not exist.");
        todo.getTodo(100);
    }

    function testEmitTodoAddedEvent() public {
        string memory content = "Write tests";

        // Expect the event to be emitted with these arguments
        vm.expectEmit(true, true, false, true);
        emit TodoAdded(0, content);

        todo.addTodo(content);
    }
    
    function testEmitTodoStatusUpdatedEvent() public {
        todo.addTodo("Test status update");
        
        // Expect the event to be emitted with these arguments
        vm.expectEmit(true, true, false, true);
        emit TodoStatusUpdated(0, TodoList.Status.InProgress);
        
        todo.updateStatus(0, TodoList.Status.InProgress);
    }
}
