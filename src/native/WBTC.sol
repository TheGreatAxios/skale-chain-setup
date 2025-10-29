// SPDX-License-Identifier: MIT
pragma solidity 0.6.12;

import {ERC20} from "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract WBTC is ERC20 {
    constructor() public ERC20("SKALE WBTC", "WBTC") {
        _mint(msg.sender, 100_000_000 * 10 ** 8);
    }

    function decimals() public view override returns (uint8) {
        return 8;
    }

    function mint(address to, uint256 amount) public {
        _mint(to, amount);
    }

    function burn(address from, uint256 amount) public {
        _burn(from, amount);
    }
}
