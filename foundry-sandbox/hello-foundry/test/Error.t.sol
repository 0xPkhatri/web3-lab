// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.18;

import "forge-std/Test.sol";
import {Error} from "../src/Error.sol";

contract ErrorTest is Test {
    Error public err;

    function setUp() public {
        err = new Error();
    }

    // function test_Revert() public {
    //     err.throwError();  
    // }

    function testRevert() public {
        vm.expectRevert();
        err.throwError();  
    }

    function testRequireMessage() public {
        vm.expectRevert(bytes("Not authorized"));
        err.throwError();
    }

    function testCustomError() public {
        vm.expectRevert(Error.NotAuthorized.selector);
        err.throwCustomError();
    }

    // function testErrorLabel() public {
    //     assertEq(uint256(1), uint256(1),"test 1");
    //     assertEq(uint256(1), uint256(1),"test 2");
    //     assertEq(uint256(1), uint256(1),"test 3");
    //     assertEq(uint256(1), uint256(2),"test 4");
    //     assertEq(uint256(1), uint256(1),"test 5");
    // }
}