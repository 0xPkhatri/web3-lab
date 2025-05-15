// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import {Test} from "forge-std/Test.sol";

contract SignTest is Test {

    function test_Signature() public {
        uint256 privateKey = 123;
        address pubKey = vm.addr(privateKey);

        bytes32 message = keccak256("Hello, World!");
        bytes32 messageHash = keccak256(abi.encodePacked(message));

        (uint8 v, bytes32 r, bytes32 s) = vm.sign(privateKey, messageHash);
        
        address signer = ecrecover(messageHash, v, r, s);
        assertEq(signer, pubKey);
    }    
}
