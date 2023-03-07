//SPDX-License-Identifier: MIT
pragma solidity 0.8.17;

contract MyERC20 {
    string public name;
    string public symbol;
    uint public decimals = 18;
    uint public totalSupply = 0;
    
    address owner;

    mapping (address => uint) balance;
    mapping (address => mapping (address => uint)) _allowance;

    constructor(string memory __name, string memory __symbol){
        name = __name;
        symbol = __symbol;
        owner = msg.sender;
    }

// FUNCTIONS goes here

function balanceOf(address account) public view returns(uint){
    return balance[account] + _allowance[owner][account];
}

function transfer(address to,uint amount) public returns(bool){
    require(balance[msg.sender] >= amount,"insufficient amount");
    
    balance[msg.sender] = balance[msg.sender] - amount;
    balance[to] = balance[to] + amount; 
    
    return true;
}

function allowance(address _owner, address spender) public view returns(uint){
    
    return _allowance[_owner][spender];
}

function approve(address spender,uint amount) public returns(bool){
    require(balance[msg.sender] >= amount,"insuffucient amount"); 
    _allowance[msg.sender][spender] = _allowance[msg.sender][spender] + amount;
    return true;
}

function transferFrom(address from,address to,uint amount) public returns(bool){
    
    require(_allowance[from][msg.sender] >= amount || balance[msg.sender] >= amount,"Insufficient amount");

    _allowance[from][msg.sender]  -=amount;
    balance[to] = balance[to] + amount;

        return true;
}

function _mint(address account, uint256 amount) public{
   balance[account] = balance[account] + amount;
    totalSupply = totalSupply + amount; 
}

// EVENTS goes here
// Transfer(from, to, value)
// Approval(owner, spender, value)
}
