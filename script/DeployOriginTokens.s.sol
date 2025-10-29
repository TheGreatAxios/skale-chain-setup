// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.6.12;

import {Script} from "forge-std/Script.sol";

import {USDT} from "../src/native/USDT.sol";
import {WBTC} from "../src/native/WBTC.sol";
import {SkaleToken} from "../src/native/SkaleToken.sol";

contract DeployOriginTokens is Script {
    function run() external {
        vm.startBroadcast();

        // USDC -> Bridged USDC from Circle
        // WETH -> Official WETH from Chain
        new USDT();
        new WBTC();
        new SkaleToken();

        vm.stopBroadcast();
    }
}