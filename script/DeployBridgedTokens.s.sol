// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.6.12;

import {Script} from "forge-std/Script.sol";

import {USDT} from "../src/bridged/USDT.sol";
import {WBTC} from "../src/bridged/WBTC.sol";
import {WETH} from "../src/bridged/WETH.sol";
import {SkaleToken} from "../src/bridged/SkaleToken.sol";

contract DeployBridgedTokens is Script {
    function run() external {
        bytes32 saltUsdt = keccak256(abi.encodePacked("SKALE_USDT"));
        bytes32 saltWbtc = keccak256(abi.encodePacked("SKALE_WBTC"));
        bytes32 saltWeth = keccak256(abi.encodePacked("SKALE_WETH"));
        bytes32 saltSkl = keccak256(abi.encodePacked("SKALE_SKL_2"));

        vm.startBroadcast();

        new USDT{salt: saltUsdt}();
        new WBTC{salt: saltWbtc}();
        new WETH{salt: saltWeth}();
        new SkaleToken{salt: saltSkl}();

        vm.stopBroadcast();
    }
}
