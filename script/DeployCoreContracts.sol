// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

import {Script} from "forge-std/Script.sol";

contract DeployCreate2Factory is Script {
    function run() external {
        /**
         * This is a pre-signed raw transaction for the Create2Factory contract
         *     DO NOT REMOVE THESE PAYABLE TRANSFERS
         **
         */

        // Provide gas to the Create2Factory contract deployer
        payable(0x3fAB184622Dc19b6109349B94811493BF2a45362).transfer(1 ether);

        vm.startBroadcast();

        /****** Deploy Create2Factory ******/
        bytes memory rawTx =
            hex"f8a58085174876e800830186a08080b853604580600e600039806000f350fe7fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe03601600081602082378035828234f58015156039578182fd5b8082525050506014600cf31ba02222222222222222222222222222222222222222222222222222222222222222a02222222222222222222222222222222222222222222222222222222222222222";

        vm.broadcastRawTransaction(rawTx);

        vm.stopBroadcast();
    }
}
