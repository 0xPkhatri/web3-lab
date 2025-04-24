// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

contract Event {
    event Transfer(address indexed from, address indexed to, uint256 amount);

    function transfer(address to, uint256 amount) public {
        emit Transfer(msg.sender, to, amount);
    }

    function transferMany(address from, address[] calldata to, uint256[] calldata amount) public {
        for (uint256 i = 0; i < to.length; i++) {
            emit Transfer(from, to[i], amount[i]);
        }
    }
}
