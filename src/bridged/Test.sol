// SPDX-License-Identifier: MIT
pragma solidity 0.6.12;

import {x402BridgedToken} from "../x402BridgedToken.sol";
import {console} from "forge-std/console.sol";

contract TestToken is x402BridgedToken("Test Token", "TEST", 18) {}
