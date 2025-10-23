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
        bytes32 saltUSDC = keccak256(abi.encodePacked("SKALE_USDC"));
        bytes32 saltUSDT = keccak256(abi.encodePacked("SKALE_USDT"));
        bytes32 saltwstETH = keccak256(abi.encodePacked("SKALE_wstETH"));
        bytes32 saltWBTC = keccak256(abi.encodePacked("SKALE_WBTC"));
        bytes32 saltUSDe = keccak256(abi.encodePacked("SKALE_USDe"));
        bytes32 saltUSDS = keccak256(abi.encodePacked("SKALE_USDS"));
        bytes32 saltWETH = keccak256(abi.encodePacked("SKALE_WETH"));
        bytes32 saltSKL = keccak256(abi.encodePacked("SKALE_SKL"));

        vm.startBroadcast();

        new USDC{salt: saltUSDC}();
        new wstETH{salt: saltwstETH}();
        new WBTC{salt: saltWBTC}();
        new USDT{salt: saltUSDT}();
        new USDe{salt: saltUSDe}();
        new USDS{salt: saltUSDS}();
        new WETH{salt: saltWETH}();
        new SkaleToken{salt: saltSKL}();

        vm.stopBroadcast();
    }
}
