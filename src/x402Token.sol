// SPDX-License-Identifier: MIT
pragma solidity 0.6.12;

import {SkaleBridgedERC20} from "./SkaleBridgedERC20.sol";
import {EIP3009} from "@circle/contracts/v2/EIP3009.sol";
import {EIP2612} from "@circle/contracts/v2/EIP2612.sol";
import {EIP712} from "@circle/contracts/util/EIP712.sol";
import {SafeMath} from "@openzeppelin/contracts/math/SafeMath.sol";
import {ERC20} from "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import {AbstractFiatTokenV1} from "@circle/contracts/v1/AbstractFiatTokenV1.sol";

contract x402Token is EIP3009, EIP2612, SkaleBridgedERC20 {
    using SafeMath for uint256;

    constructor(string memory name, string memory symbol, uint8 decimals)
        public
        SkaleBridgedERC20(name, symbol, decimals)
    {
        _DEPRECATED_CACHED_DOMAIN_SEPARATOR = EIP712.makeDomainSeparator(name, "1");
    }

    /**
     * @notice Increase the allowance by a given increment
     * @param spender   Spender's address
     * @param increment Amount of increase in allowance
     * @return True if successful
     */
    function increaseAllowance(address spender, uint256 increment) public virtual override returns (bool) {
        _increaseAllowance(msg.sender, spender, increment);
        return true;
    }

    /**
     * @notice Decrease the allowance by a given decrement
     * @param spender   Spender's address
     * @param decrement Amount of decrease in allowance
     * @return True if successful
     */
    function decreaseAllowance(address spender, uint256 decrement) public virtual override returns (bool) {
        _decreaseAllowance(msg.sender, spender, decrement);
        return true;
    }

    /**
     * @notice Execute a transfer with a signed authorization
     * @param from          Payer's address (Authorizer)
     * @param to            Payee's address
     * @param value         Amount to be transferred
     * @param validAfter    The time after which this is valid (unix time)
     * @param validBefore   The time before which this is valid (unix time)
     * @param nonce         Unique nonce
     * @param v             v of the signature
     * @param r             r of the signature
     * @param s             s of the signature
     */
    function transferWithAuthorization(
        address from,
        address to,
        uint256 value,
        uint256 validAfter,
        uint256 validBefore,
        bytes32 nonce,
        uint8 v,
        bytes32 r,
        bytes32 s
    ) external {
        _transferWithAuthorization(from, to, value, validAfter, validBefore, nonce, v, r, s);
    }

    /**
     * @notice Receive a transfer with a signed authorization from the payer
     * @dev This has an additional check to ensure that the payee's address
     * matches the caller of this function to prevent front-running attacks.
     * @param from          Payer's address (Authorizer)
     * @param to            Payee's address
     * @param value         Amount to be transferred
     * @param validAfter    The time after which this is valid (unix time)
     * @param validBefore   The time before which this is valid (unix time)
     * @param nonce         Unique nonce
     * @param v             v of the signature
     * @param r             r of the signature
     * @param s             s of the signature
     */
    function receiveWithAuthorization(
        address from,
        address to,
        uint256 value,
        uint256 validAfter,
        uint256 validBefore,
        bytes32 nonce,
        uint8 v,
        bytes32 r,
        bytes32 s
    ) external {
        _receiveWithAuthorization(from, to, value, validAfter, validBefore, nonce, v, r, s);
    }

    /**
     * @notice Attempt to cancel an authorization
     * @dev Works only if the authorization is not yet used.
     * @param authorizer    Authorizer's address
     * @param nonce         Nonce of the authorization
     * @param v             v of the signature
     * @param r             r of the signature
     * @param s             s of the signature
     */
    function cancelAuthorization(address authorizer, bytes32 nonce, uint8 v, bytes32 r, bytes32 s) external {
        _cancelAuthorization(authorizer, nonce, v, r, s);
    }

    /**
     * @notice Update allowance with a signed permit
     * @param owner       Token owner's address (Authorizer)
     * @param spender     Spender's address
     * @param value       Amount of allowance
     * @param deadline    The time at which the signature expires (unix time), or max uint256 value to signal no expiration
     * @param v           v of the signature
     * @param r           r of the signature
     * @param s           s of the signature
     */
    function permit(address owner, address spender, uint256 value, uint256 deadline, uint8 v, bytes32 r, bytes32 s)
        external
        virtual
    {
        _permit(owner, spender, value, deadline, v, r, s);
    }

    /**
     * @dev Internal function to increase the allowance by a given increment
     * @param owner     Token owner's address
     * @param spender   Spender's address
     * @param increment Amount of increase
     */
    function _increaseAllowance(address owner, address spender, uint256 increment) internal override {
        uint256 current = allowance(owner, spender);
        _approve(owner, spender, current.add(increment));
    }

    /**
     * @dev Internal function to decrease the allowance by a given decrement
     * @param owner     Token owner's address
     * @param spender   Spender's address
     * @param decrement Amount of decrease
     */
    function _decreaseAllowance(address owner, address spender, uint256 decrement) internal override {
        uint256 current = allowance(owner, spender);
        _approve(owner, spender, current.sub(decrement, "ERC20: decreased allowance below zero"));
    }

    // Resolve multiple inheritance for _approve and _transfer
    function _approve(address owner, address spender, uint256 amount)
        internal
        virtual
        override(ERC20, AbstractFiatTokenV1)
    {
        super._approve(owner, spender, amount);
    }

    function _transfer(address sender, address recipient, uint256 amount)
        internal
        virtual
        override(ERC20, AbstractFiatTokenV1)
    {
        super._transfer(sender, recipient, amount);
    }
}
