// SPDX-License-Identifier: MIT
pragma solidity 0.6.12;

import {x402BridgedToken} from "../x402BridgedToken.sol";

contract USDT is x402BridgedToken("Tether USD", "USDT", 6) {}
