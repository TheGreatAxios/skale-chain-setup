// SPDX-License-Identifier: MIT
pragma solidity 0.6.12;

import {SkaleNativeERC20} from "../SkaleNativeERC20.sol";

contract AxiosUSD is SkaleNativeERC20 {
    constructor(address creator) public SkaleNativeERC20("Axios USD", "AxiosUSD", 6) {
        _mint(creator, 10_000_000e6);
        _setupRole(DEFAULT_ADMIN_ROLE, creator);
        _setupRole(MINTER_ROLE, creator);
    }
}
