// SPDX-License-Identifier: MIT
pragma solidity 0.6.12;

import {x402BridgedToken} from "../x402BridgedToken.sol";

contract wstETH is x402BridgedToken("Wrapped liquid staked Ether 2.0", "wstETH", 18) {}
