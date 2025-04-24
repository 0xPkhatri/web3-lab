// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import "forge-std/Test.sol";
import {Auction} from "../src/Time.sol";

contract TimeTest is Test {
    Auction public auction;
    uint256 private startAt;

    function setUp() public {
        auction = new Auction();
        startAt = block.timestamp;
    }

    function testBidFailBeforeStart() public {
        vm.expectRevert("Auction bid");
        auction.bid();
    }

    function testBid() public {
        vm.warp(startAt + 1 days);
        auction.bid();
    }

    function testBidFailsAfterEndTime() public {
        vm.warp(startAt + 3 days);
        vm.expectRevert("Auction bid");
        auction.bid();
    }
    
    
}
