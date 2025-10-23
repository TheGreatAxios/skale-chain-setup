// SPDX-License-Identifier: MIT
pragma solidity 0.6.12;

import {SkaleNativeERC20} from "../SkaleNativeERC20.sol";

contract AxiosUSD is SkaleNativeERC20 {
    constructor() public SkaleNativeERC20("Axios USD", "AxiosUSD", 6) {
        _mint(msg.sender, 10_000_000e6);
    }
}
