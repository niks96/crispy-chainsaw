// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;

contract Bank {
    address private owner;
    //address payable bankAddress;

    mapping (address => uint) public balanceOf; 

    constructor() {
        owner = msg.sender;
        //bankAddress = address(this);
    }

    modifier isOwner() {
        require(msg.sender == owner)
        _;
    }

    function deposit() payable public {
        balanceOf[msg.sender] += msg.value;
    }

    function withdraw(uint _amount) public {
        require(balanceOf[msg.sender] >= _amount, "Insufficient funds.");
        balanceOf[msg.sender] -= _amount;
    }

    function showBankBalance() private view isOwner returns (uint) {
        return (address(this).balance);
    }
}