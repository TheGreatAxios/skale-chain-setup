// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.6.12;

import {Script} from "forge-std/Script.sol";
import {AxiosUSD} from "../src/native/AxiosUSD.sol";
import {console} from "forge-std/console.sol";

contract DeployAxiosUSD is Script {
    function run() external {
        vm.startBroadcast();

        bytes32 salt = keccak256(abi.encodePacked("axiosUSD"));
        address deployer = msg.sender;

        AxiosUSD axiosUSD = new AxiosUSD{salt: salt}(deployer);
        address axiosUSDAddress = address(axiosUSD);

        console.log("AxiosUSD deployed to:", axiosUSDAddress);

        vm.stopBroadcast();
    }
}
