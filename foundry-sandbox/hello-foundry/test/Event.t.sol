// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import "forge-std/Test.sol";
import {Event} from "../src/Event.sol";

contract EventTest is Test {
    Event public e;

    event Transfer(address indexed from, address indexed to, uint256 amount);

    function setUp() public {
        e = new Event();
    }
    
    function testEmitTransferEvent() public {
        vm.expectEmit(true, true, false, false);
        emit Transfer(address(this), address(123), 456);
        e.transfer(address(123), 4956);

        // vm.recordLogs();
        // vm.expectEmit();
        // emit Transfer(address(this), address(1), 100);
        // e.transfer(address(1), 100);
        // // i want to console.log this event
        // // We can't directly access the event, but we can log the parameters
        // console.log("Transfer event parameters:");
        // console.log("From:", address(this));
        // console.log("To:", address(1)); 
        // console.log("Amount:", 100);
    }

    function testEmitTransferManyEvent() public {
        address[] memory to = new address[](2);
        to[0] = address(123);
        to[1] = address(456);

        uint256[] memory amount = new uint256[](2);
        amount[0] = 777;
        amount[1] = 888;

        for (uint256 i = 0; i < to.length; i++) {
            vm.expectEmit(true, true, false, false);
            emit Transfer(address(this), to[i], amount[i]);
        }
       
        e.transferMany(address(this), to, amount);
    }
}
