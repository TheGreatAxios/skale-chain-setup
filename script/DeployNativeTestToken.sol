// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.6.12;

import {Script} from "forge-std/Script.sol";

import {NativeTestToken} from "../src/native/NativeTestToken.sol";
import {console} from "forge-std/console.sol";

contract DeployNativeTestToken is Script {
    function run() external {
        vm.startBroadcast();

        NativeTestToken nativeTestToken = new NativeTestToken();
        address nativeTestTokenAddress = address(nativeTestToken);

        console.log("Native Test Token deployed to:", nativeTestTokenAddress);

        vm.stopBroadcast();
    }
}
