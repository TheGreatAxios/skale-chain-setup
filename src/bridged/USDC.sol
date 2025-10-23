// SPDX-License-Identifier: MIT
pragma solidity 0.6.12;

import {x402BridgedToken} from "../x402BridgedToken.sol";

contract USDC is x402BridgedToken("USD Coin", "USDC", 6) {}
