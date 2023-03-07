//SPDX-License-Identifier: MIT

pragma solidity 0.8.17;

contract piggyBank {
    
    fallback() external payable{}

    function withdraw() public{

    selfdestruct(payable(msg.sender));
    }


}