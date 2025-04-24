// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;
 
// vm.wrap set block timestamp to future timestamp
// vm.roll set block number
// skip set increment current timestamp
// rewind decrement current timestamp


contract Auction {
    uint256 public startAt = block.timestamp + 1 days;
    uint256 public endAt = startAt + 2 days;

    function bid() external {
        require(block.timestamp >= startAt && block.timestamp < endAt, "Auction bid");
    }

    function end() external {
        require(block.timestamp >= endAt, "Auction not ended");
    }

}