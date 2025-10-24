// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.6.12;

import {Script} from "forge-std/Script.sol";

import {USDC} from "../src/bridged/USDC.sol";

contract DeployX402BridgedUSDC is Script {
    function run() external {
        bytes32 saltUsdc = keccak256(abi.encodePacked("X402_USDC"));

        vm.startBroadcast();

        new USDC{salt: saltUsdc}();

        vm.stopBroadcast();
    }
}
