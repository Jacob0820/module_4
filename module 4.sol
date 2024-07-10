// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract MyToken is ERC20 {
    uint public maxTransactionAmount = 1000;
    address private _contractOwner;

    struct Product {
        string name;
        uint256 price;
    }

    Product[] public products;

    mapping(address => uint256) public accountBalances;

    constructor() ERC20("My Token", "MTK") {
        _contractOwner = msg.sender;
        _mint(msg.sender, 100 * 10 ** decimals()); // Mint 100 tokens initially to the contract deployer
        addProduct("Product 1", 10 * 1 ** decimals());
        addProduct("Product 2", 20 * 1 ** decimals());
        addProduct("Product 3", 30 * 1 ** decimals());
    }

    modifier onlyOwner {
        require(msg.sender == _contractOwner, "Only owner can use this");
        _;
    }
    
    function depositTokens(address recipient, uint256 amount) public onlyOwner {
        require(amount > 0, "Amount must be greater than 0");
        require(balanceOf(_contractOwner) >= amount, "Insufficient balance");

        _transfer(_contractOwner, recipient, amount);
        accountBalances[recipient] += amount;
    }

    function withdrawTokens(address account, uint256 amount) public {
        require(accountBalances[account] >= amount, "Insufficient balance");

        if (amount > maxTransactionAmount) {
            revert("Transaction amount exceeds maximum allowed");
        }

        _burn(account, amount);
        accountBalances[account] -= amount;
    }

    function changeMaxTransactionAmount(uint256 newMax) public onlyOwner {
        maxTransactionAmount = newMax;
    }

    function contractOwner() public view returns (address) {
        return _contractOwner;
    }

    function addProduct(string memory name, uint256 price) public onlyOwner {
        products.push(Product(name, price));
    }

    function redeemProduct(uint256 index) public {
        require(index < products.length, "Invalid product index");

        Product storage product = products[index];
        require(balanceOf(msg.sender) >= product.price, "Insufficient balance");

        _transfer(msg.sender, _contractOwner, product.price);
    }

    function getProducts() public view returns (Product[] memory) {
        return products;
    }
}
