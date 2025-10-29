// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.6.12;

import {Script} from "forge-std/Script.sol";

import {WETH} from "../src/bridged/WETH.sol";
import {console} from "forge-std/console.sol";

contract DeployX402BridgedWETH is Script {
    function run() external {
        bytes32 saltWeth = keccak256(abi.encodePacked("X402_WETH"));

        vm.startBroadcast();

        WETH weth = new WETH{salt: saltWeth}();
        address wethAddress = address(weth);

        console.log("WETH deployed to:", wethAddress);

        vm.stopBroadcast();
    }
}
