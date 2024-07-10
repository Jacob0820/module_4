# module_4

# MyToken Smart Contract

MyToken is an ERC20 token that allows for minting, transferring, and redeeming tokens for products in a virtual shop. This smart contract is built using Solidity and utilizes OpenZeppelin's ERC20 implementation.

## Features

- Minting of initial tokens to the contract deployer.
- Adding products to a virtual shop.
- Depositing tokens to users.
- Withdrawing tokens with a maximum transaction limit.
- Redeeming tokens for products in the shop.
- Changing the maximum transaction amount (only by the owner).

## Contract Details

### State Variables

- `maxTransactionAmount`: The maximum allowed transaction amount for withdrawals.
- `_contractOwner`: The address of the contract owner.
- `products`: An array of products available in the shop.
- `accountBalances`: A mapping to keep track of user balances.

### Structs

- `Product`: Represents a product in the shop with a name and price.

### Constructor

```solidity
constructor() ERC20("My Token", "MTK") {
    _contractOwner = msg.sender;
    _mint(msg.sender, 100 * 10 ** decimals());
    addProduct("Product 1", 10 * 1 ** decimals());
    addProduct("Product 2", 20 * 1 ** decimals());
    addProduct("Product 3", 30 * 1 ** decimals());
}
```

Mints 100 tokens to the contract deployer and adds three initial products to the shop.

### Modifiers

- `onlyOwner`: Ensures that only the contract owner can call certain functions.

### Functions

- `depositTokens(address recipient, uint256 amount)`: Allows the owner to deposit tokens to a specified recipient.

- `withdrawTokens(address account, uint256 amount)`: Allows users to withdraw tokens from their balance, ensuring the amount does not exceed the maximum transaction amount.

- `changeMaxTransactionAmount(uint256 newMax)`: Allows the owner to change the maximum transaction amount.

- `contractOwner() public view returns (address)`: Returns the address of the contract owner.

- `addProduct(string memory name, uint256 price)`: Allows the owner to add a new product to the shop.

- `redeemProduct(uint256 index)`: Allows users to redeem a product from the shop using their tokens.

- `getProducts() public view returns (Product[] memory)`: Returns the list of products in the shop.

## Usage

1. **Deploy the Contract:**
   Deploy the `MyToken` contract to your desired Ethereum network.

2. **Interact with the Contract:**
   Use a tool like Remix, Truffle, or a web3-enabled front end to interact with the contract. The owner can deposit tokens, add products, and change the maximum transaction amount. Users can withdraw tokens and redeem products.

3. **Deposit Tokens:**
   The owner can deposit tokens to user accounts using the `depositTokens` function.

4. **Withdraw Tokens:**
   Users can withdraw their tokens using the `withdrawTokens` function, respecting the maximum transaction limit.

5. **Redeem Products:**
   Users can redeem products from the shop using the `redeemProduct` function if they have sufficient token balance.

## Development

- **Requirements:**
  - Solidity ^0.8.0
  - OpenZeppelin Contracts

- **Setup:**
  Install dependencies using npm or yarn:
  ```bash
  npm install @openzeppelin/contracts
  ```

- **Compile and Deploy:**
 

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.
```

Feel free to modify this README file to fit your specific needs.
