# Todo List Smart Contract

A simple Todo List implementation on the Ethereum blockchain using Solidity.

## Deployed Contract

The TodoList contract has been deployed on Lisk Sepolia testnet:
- Transaction: [0x8978daa9cc519e03f76427ac3367dfba8df37edb4e6e039e3dde9ce779dcdff4](https://sepolia-blockscout.lisk.com/tx/0x8978daa9cc519e03f76427ac3367dfba8df37edb4e6e039e3dde9ce779dcdff4)

## Features

- Create new todo items
- Update todo status (Pending, InProgress, Completed)
- View individual todo items
- Get all todo IDs
- Get total number of todos

## Contract Structure

- `TodoList.sol`: Main contract with todo management functionality
- `Todo.s.sol`: Deployment script
- `Todo.t.sol`: Test suite

## Deployment Instructions

### Prerequisites
- [Foundry](https://book.getfoundry.sh/getting-started/installation) installed
- An Ethereum wallet with funds on the target network
- RPC URL for the target network

### Steps to Deploy

1. Clone this repository:
   ```shell
   git clone https://github.com/yourusername/todo-list-contract.git
   cd todo-list-contract
   ```

2. Install dependencies:
   ```shell
   forge install
   ```

3. Create a `.env` file in the project root with your private key:
   ```
   PRIVATE_KEY=0xYourPrivateKeyHere
   ```

4. Deploy to a testnet (e.g., Lisk Sepolia):
   ```shell
   forge script script/Todo.s.sol:TodoScript --rpc-url https://rpc.sepolia-api.lisk.com --broadcast
   ```

5. For mainnet deployment (use with caution):
   ```shell
   forge script script/Todo.s.sol:TodoScript --rpc-url <mainnet_rpc_url> --broadcast
   ```

6. Verify your contract (if supported by the network):
   ```shell
   forge verify-contract <deployed_address> src/TodoList.sol:TodoList --chain-id <chain_id> --api-key <explorer_api_key>
   ```

### Interacting with the Deployed Contract

You can interact with the deployed contract using Cast:

```shell
# Add a new todo
cast send <contract_address> "addTodo(string)" "Buy milk" --rpc-url <rpc_url> --private-key <your_private_key>

# Update a todo status (0=Pending, 1=InProgress, 2=Completed)
cast send <contract_address> "updateStatus(uint256,uint8)" 0 2 --rpc-url <rpc_url> --private-key <your_private_key>

# Get a todo
cast call <contract_address> "getTodo(uint256)" 0 --rpc-url <rpc_url>
```
