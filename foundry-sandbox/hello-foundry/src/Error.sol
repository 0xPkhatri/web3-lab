// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

contract Error {
    error NotAuthorized();

    function throwError() external{
        require(false, "Not authorized");
    }

    function throwCustomError() external {
        revert NotAuthorized();
    }
}