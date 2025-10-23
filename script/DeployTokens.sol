// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.6.12;

import {Script} from "forge-std/Script.sol";

import {USDC} from "../src/bridged/USDC.sol";
import {USDT} from "../src/bridged/USDT.sol";
import {wstETH} from "../src/bridged/wstETH.sol";
import {WBTC} from "../src/bridged/WBTC.sol";
import {USDe} from "../src/bridged/USDe.sol";
import {USDS} from "../src/bridged/USDS.sol";
import {WETH} from "../src/bridged/WETH.sol";
import {SkaleToken} from "../src/bridged/SkaleToken.sol";

contract DeployTokens is Script {
    function run() external {
        bytes32 saltUsdc = keccak256(abi.encodePacked("SKALE_USDC"));
        bytes32 saltUsdt = keccak256(abi.encodePacked("SKALE_USDT"));
        bytes32 saltWsteth = keccak256(abi.encodePacked("SKALE_wstETH"));
        bytes32 saltWbtc = keccak256(abi.encodePacked("SKALE_WBTC"));
        bytes32 saltUsde = keccak256(abi.encodePacked("SKALE_USDe"));
        bytes32 saltUsds = keccak256(abi.encodePacked("SKALE_USDS"));
        bytes32 saltWeth = keccak256(abi.encodePacked("SKALE_WETH"));
        bytes32 saltSkl = keccak256(abi.encodePacked("SKALE_SKL"));

        vm.startBroadcast();

        new USDC{salt: saltUsdc}();
        new wstETH{salt: saltWsteth}();
        new WBTC{salt: saltWbtc}();
        new USDT{salt: saltUsdt}();
        new USDe{salt: saltUsde}();
        new USDS{salt: saltUsds}();
        new WETH{salt: saltWeth}();
        new SkaleToken{salt: saltSkl}();

        vm.stopBroadcast();
    }
}
