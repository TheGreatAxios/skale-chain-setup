// SPDX-License-Identifier: MIT
pragma solidity 0.6.12;

import {x402BridgedToken} from "../x402BridgedToken.sol";

contract USDS is x402BridgedToken("USDS Stablecoin", "USDS", 18) {}
