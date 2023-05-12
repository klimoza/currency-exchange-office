// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract CurrencyExchangeOffice {

    address public owner;
    mapping(IERC20 => uint256) private exchangeRates;

    modifier onlyOwner(){
        require(msg.sender == owner, "Only the owner can perform this operation.");
        _;
    }
    
    constructor(address coinAddress) {
        owner = msg.sender;
        exchangeRates[ERC20(coinAddress)] = 1;
    }

    function setRate(address token, uint256 rate) public onlyOwner {
       exchangeRates[IERC20(token)] = rate;
    }

    function buyTokens(address token, uint amount) public payable {
        ERC20 currentToken = ERC20(token);
        uint currentTokenBalance = currentToken.balanceOf(address(this));
        require(amount * exchangeRates[currentToken] <= msg.value, "Insufficient payment.");
        require(amount <= currentTokenBalance, "Not enough tokens to perform the operation.");

        currentToken.transfer(msg.sender, amount);
    }

    function sellTokens(address token, uint amount) public payable {
        ERC20 currentToken = ERC20(token);
        uint currentTokenBalance = currentToken.balanceOf(msg.sender);
        require(amount * exchangeRates[currentToken] <= currentTokenBalance, "Insufficient amount of wei.");
        require(currentTokenBalance <= amount, "Not enough tokens to perform the operation.");
        
        currentToken.transferFrom(msg.sender, address(this), amount);
        payable(msg.sender).transfer(amount * exchangeRates[currentToken]);
    }
}
