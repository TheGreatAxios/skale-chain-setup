// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.6.12;

import {Script} from "forge-std/Script.sol";

import {TestToken} from "../src/bridged/Test.sol";
import {console} from "forge-std/console.sol";

contract DeployX402Test is Script {
    function run() external {
        bytes32 saltTest = keccak256(abi.encodePacked("X402_TEST"));

        vm.startBroadcast();

        TestToken test = new TestToken{salt: saltTest}();
        address testAddress = address(test);

        console.log("Test deployed to:", testAddress);

        vm.stopBroadcast();
    }
}
