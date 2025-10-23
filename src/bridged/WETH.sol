// SPDX-License-Identifier: MIT
pragma solidity 0.6.12;

import {x402BridgedToken} from "../x402BridgedToken.sol";

contract WETH is x402BridgedToken("Wrapped Ether", "WETH", 18) {}
