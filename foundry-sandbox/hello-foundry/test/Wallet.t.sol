// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.26;
import "forge-std/Test.sol";
import "forge-std/console.sol";
import {Wallet} from "../src/Wallet.sol";

contract WalletTest is Test {
    Wallet public wallet;

    function setUp() public {
        wallet = new Wallet{value:1e18}();
    }


    function _send(uint256 amount) private{
        (bool ok, ) = address(wallet).call{value:amount}("");
        require(ok, "Failed to send ETH");
    }

    function testEthBalance() public {
        console.log('ETH balance', address(this).balance / 1e18);
    }
    
    function testSendEth()public {
        uint bal = address(wallet).balance;
        deal(address(1), 100);
        assertEq(address(1).balance, 100);
        deal(address(1), 10);
        assertEq(address(1).balance, 10);

        deal(address(1), 123);
        vm.prank(address(1));
        _send(123);

        hoax(address(1), 456);
        _send(456);

        assertEq(address(wallet).balance, bal + 123 + 456);
    }
}
