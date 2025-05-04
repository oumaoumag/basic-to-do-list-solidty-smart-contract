// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Script, console} from "forge-std/Script.sol";
import { TodoList } from "../src/TodoList.sol";

contract TodoListScript is Script {
    TodoList public todoList;

    function setUp() public {}

    function run() public {
        vm.startBroadcast();

        todoList = new TodoList();

        vm.stopBroadcast();
    }
}
