// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.26;

import "forge-std/Test.sol";
import {Wallet} from "../src/Wallet.sol";

contract AuthTest is Test {
    Wallet public wallet;

    function setUp() public {
        wallet = new Wallet();
        // console.log('address of initiated wallet: ', address(wallet));
        // console.log('msg.send who calling Auth contract test: ', msg.sender);
        // console.log('auth contract address', address(this));
    }

    function testSetOwner() public {   
        console.log(msg.sender);
        console.log('owner_before: ', wallet.owner());
        wallet.setOwner(address(1));
        console.log('owner_after: ', wallet.owner());
        console.log(msg.sender);
        assertEq(wallet.owner(), address(1)); 

    } 

    function testNotOwner() public {
        vm.expectRevert();
        vm.startPrank(address(1));

        wallet.setOwner(address(1));
    }

}