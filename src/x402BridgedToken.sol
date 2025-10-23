// SPDX-License-Identifier: MIT
pragma solidity 0.6.12;

import {SafeMath} from "@openzeppelin/contracts/math/SafeMath.sol";
import {Address} from "@openzeppelin/contracts/utils/Address.sol";

import {EIP3009} from "./lib/EIP3009.sol";
import {EIP2612} from "./lib/EIP2612.sol";
import {EIP712} from "./lib/EIP712.sol";
import {SkaleBridgedERC20} from "./SkaleBridgedERC20.sol";

contract x402BridgedToken is EIP3009, EIP2612, SkaleBridgedERC20 {
    using SafeMath for uint256;
    using Address for address;

    constructor(string memory name, string memory symbol, uint8 decimals)
        public
        SkaleBridgedERC20(name, symbol, decimals)
    {
        DOMAIN_SEPARATOR = EIP712.makeDomainSeparator(name, "1");
    }
}
