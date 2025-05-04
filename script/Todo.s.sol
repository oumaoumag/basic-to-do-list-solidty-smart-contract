// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Script, console} from "forge-std/Script.sol";
import {TodoList} from "../src/TodoList.sol";

contract TodoScript is Script {
    TodoList public todoList;

    function setUp() public {}

    function run() public {
        // Read the private key from the .env file
        uint256 deployerPrivateKey = vm.envUint("PRIVATE_KEY");
        
        // Start broadcasting transactions using the private key
        vm.startBroadcast(deployerPrivateKey);
        
        todoList = new TodoList();
        console.log("TodoList deployed at:", address(todoList));
        
        vm.stopBroadcast();
    }
}
