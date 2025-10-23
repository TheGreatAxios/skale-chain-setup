// SPDX-License-Identifier: MIT
pragma solidity 0.6.12;

import {x402Token} from "./lib/Token.sol";
import {AccessControl} from "@openzeppelin/contracts/access/AccessControl.sol";

/**
 * @title SkaleNativeERC20
 * @dev This contract is an ERC20 token implementation with role-based access control for minting and burning.
 * It utilizes OpenZeppelin's ERC20 and AccessControl for functionality.
 */
contract SkaleNativeERC20 is x402Token, AccessControl {
    // Define roles using hashed constants for efficient comparison.
    bytes32 public constant MINTER_ROLE = keccak256("MINTER_ROLE");

    /**
     * @notice Constructor initializes the ERC20 token and sets up roles.
     * @param name The name of the token.
     * @param symbol The symbol of the token.
     */
    constructor(string memory name, string memory symbol, uint8 decimals) public x402Token(name, symbol, decimals) {
        // Assign the minter role to the caller.
        _setupRole(MINTER_ROLE, msg.sender);
    }

    /**
     * @notice Mints new tokens and assigns them to the specified address.
     * @dev Caller must have the MINTER_ROLE to invoke this function.
     * @param to The address that will receive the newly minted tokens.
     * @param amount The amount of tokens to mint.
     * Requirements:
     * - Caller must have MINTER_ROLE.
     * - `to` cannot be the zero address.
     */
    function mint(address to, uint256 amount) public virtual {
        // Ensure that the caller has the MINTER_ROLE.
        require(hasRole(MINTER_ROLE, msg.sender), "Caller is not a minter");

        // Mint the specified amount of tokens to the target address.
        _mint(to, amount);
    }

    /**
     * @notice Burns tokens from the caller's account.
     * @param amount The amount of tokens to burn.
     * Requirements:
     * - Caller must have at least `amount` tokens.
     */
    function burn(uint256 amount) public virtual {
        _burn(msg.sender, amount);
    }
}
