// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.6.12;

import {Script} from "forge-std/Script.sol";

import {USDC} from "../src/tokens/USDC.sol";
import {USDT} from "../src/tokens/USDT.sol";
import {wstETH} from "../src/tokens/wstETH.sol";
import {WBTC} from "../src/tokens/WBTC.sol";
import {USDe} from "../src/tokens/USDe.sol";
import {USDS} from "../src/tokens/USDS.sol";
import {WETH} from "../src/tokens/WETH.sol";
import {SkaleToken} from "../src/tokens/SkaleToken.sol";

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
