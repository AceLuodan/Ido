/**
 *Submitted for verification at hecoinfo.com on 2021-02-27
 */

// SPDX-License-Identifier: MIT

pragma solidity ^0.6.2;

/*
 * @dev Provides information about the current execution context, including the
 * sender of the transaction and its data. While these are generally available
 * via msg.sender and msg.data, they should not be accessed in such a direct
 * manner, since when dealing with GSN meta-transactions the account sending and
 * paying for execution may not be the actual sender (as far as an application
 * is concerned).
 *
 * This contract is only required for intermediate, library-like contracts.
 */
contract Context {
    function _msgSender() internal view virtual returns (address payable) {
        return msg.sender;
    }

    function _msgData() internal view virtual returns (bytes memory) {
        this; // silence state mutability warning without generating bytecode - see https://github.com/ethereum/solidity/issues/2691
        return msg.data;
    }

    // uint256[50] private __gap;
}

contract ReentrancyGuard {
    bool private _notEntered;

    constructor() internal {
        // Storing an initial non-zero value makes deployment a bit more
        // expensive, but in exchange the refund on every call to nonReentrant
        // will be lower in amount. Since refunds are capped to a percetange of
        // the total transaction's gas, it is best to keep them low in cases
        // like this one, to increase the likelihood of the full refund coming
        // into effect.
        _notEntered = true;
    }

    /**
     * @dev Prevents a contract from calling itself, directly or indirectly.
     * Calling a `nonReentrant` function from another `nonReentrant`
     * function is not supported. It is possible to prevent this from happening
     * by making the `nonReentrant` function external, and make it call a
     * `private` function that does the actual work.
     */
    modifier nonReentrant() {
        // On the first call to nonReentrant, _notEntered will be true
        require(_notEntered, "ReentrancyGuard: reentrant call");

        // Any calls to nonReentrant after this point will fail
        _notEntered = false;

        _;

        // By storing the original value once again, a refund is triggered (see
        // https://eips.ethereum.org/EIPS/eip-2200)
        _notEntered = true;
    }
}

/**
 * @dev Standard math utilities missing in the Solidity language.
 */
library Math {
    /**
     * @dev Returns the largest of two numbers.
     */
    function max(uint256 a, uint256 b) internal pure returns (uint256) {
        return a >= b ? a : b;
    }

    /**
     * @dev Returns the smallest of two numbers.
     */
    function min(uint256 a, uint256 b) internal pure returns (uint256) {
        return a < b ? a : b;
    }

    /**
     * @dev Returns the average of two numbers. The result is rounded towards
     * zero.
     */
    function average(uint256 a, uint256 b) internal pure returns (uint256) {
        // (a + b) / 2 can overflow, so we distribute
        return (a / 2) + (b / 2) + (((a % 2) + (b % 2)) / 2);
    }
}

/**
 * @dev Wrappers over Solidity's arithmetic operations with added overflow
 * checks.
 *
 * Arithmetic operations in Solidity wrap on overflow. This can easily result
 * in bugs, because programmers usually assume that an overflow raises an
 * error, which is the standard behavior in high level programming languages.
 * `SafeMath` restores this intuition by reverting the transaction when an
 * operation overflows.
 *
 * Using this library instead of the unchecked operations eliminates an entire
 * class of bugs, so it's recommended to use it always.
 */
library SafeMath {
    /**
     * @dev Returns the addition of two unsigned integers, reverting on
     * overflow.
     *
     * Counterpart to Solidity's `+` operator.
     *
     * Requirements:
     * - Addition cannot overflow.
     */
    function add(uint256 a, uint256 b) internal pure returns (uint256) {
        uint256 c = a + b;
        require(c >= a, "SafeMath: addition overflow");

        return c;
    }

    /**
     * @dev Returns the subtraction of two unsigned integers, reverting on
     * overflow (when the result is negative).
     *
     * Counterpart to Solidity's `-` operator.
     *
     * Requirements:
     * - Subtraction cannot overflow.
     */
    function sub(uint256 a, uint256 b) internal pure returns (uint256) {
        return sub(a, b, "SafeMath: subtraction overflow");
    }

    /**
     * @dev Returns the subtraction of two unsigned integers, reverting with custom message on
     * overflow (when the result is negative).
     *
     * Counterpart to Solidity's `-` operator.
     *
     * Requirements:
     * - Subtraction cannot overflow.
     */
    function sub(
        uint256 a,
        uint256 b,
        string memory errorMessage
    ) internal pure returns (uint256) {
        require(b <= a, errorMessage);
        uint256 c = a - b;

        return c;
    }

    function sub0(uint256 a, uint256 b) internal pure returns (uint256) {
        return a > b ? a - b : 0;
    }

    /**
     * @dev Returns the multiplication of two unsigned integers, reverting on
     * overflow.
     *
     * Counterpart to Solidity's `*` operator.
     *
     * Requirements:
     * - Multiplication cannot overflow.
     */
    function mul(uint256 a, uint256 b) internal pure returns (uint256) {
        // Gas optimization: this is cheaper than requiring 'a' not being zero, but the
        // benefit is lost if 'b' is also tested.
        // See: https://github.com/OpenZeppelin/openzeppelin-contracts/pull/522
        if (a == 0) {
            return 0;
        }

        uint256 c = a * b;
        require(c / a == b, "SafeMath: multiplication overflow");

        return c;
    }

    /**
     * @dev Returns the integer division of two unsigned integers. Reverts on
     * division by zero. The result is rounded towards zero.
     *
     * Counterpart to Solidity's `/` operator. Note: this function uses a
     * `revert` opcode (which leaves remaining gas untouched) while Solidity
     * uses an invalid opcode to revert (consuming all remaining gas).
     *
     * Requirements:
     * - The divisor cannot be zero.
     */
    function div(uint256 a, uint256 b) internal pure returns (uint256) {
        return div(a, b, "SafeMath: division by zero");
    }

    /**
     * @dev Returns the integer division of two unsigned integers. Reverts with custom message on
     * division by zero. The result is rounded towards zero.
     *
     * Counterpart to Solidity's `/` operator. Note: this function uses a
     * `revert` opcode (which leaves remaining gas untouched) while Solidity
     * uses an invalid opcode to revert (consuming all remaining gas).
     *
     * Requirements:
     * - The divisor cannot be zero.
     */
    function div(
        uint256 a,
        uint256 b,
        string memory errorMessage
    ) internal pure returns (uint256) {
        // Solidity only automatically asserts when dividing by 0
        require(b > 0, errorMessage);
        uint256 c = a / b;
        // assert(a == b * c + a % b); // There is no case in which this doesn't hold

        return c;
    }

    /**
     * @dev Returns the remainder of dividing two unsigned integers. (unsigned integer modulo),
     * Reverts when dividing by zero.
     *
     * Counterpart to Solidity's `%` operator. This function uses a `revert`
     * opcode (which leaves remaining gas untouched) while Solidity uses an
     * invalid opcode to revert (consuming all remaining gas).
     *
     * Requirements:
     * - The divisor cannot be zero.
     */
    function mod(uint256 a, uint256 b) internal pure returns (uint256) {
        return mod(a, b, "SafeMath: modulo by zero");
    }

    /**
     * @dev Returns the remainder of dividing two unsigned integers. (unsigned integer modulo),
     * Reverts with custom message when dividing by zero.
     *
     * Counterpart to Solidity's `%` operator. This function uses a `revert`
     * opcode (which leaves remaining gas untouched) while Solidity uses an
     * invalid opcode to revert (consuming all remaining gas).
     *
     * Requirements:
     * - The divisor cannot be zero.
     */
    function mod(
        uint256 a,
        uint256 b,
        string memory errorMessage
    ) internal pure returns (uint256) {
        require(b != 0, errorMessage);
        return a % b;
    }
}

/**
 * @dev Collection of functions related to the address type
 */
library Address {
    /**
     * @dev Returns true if `account` is a contract.
     *
     * [IMPORTANT]
     * ====
     * It is unsafe to assume that an address for which this function returns
     * false is an externally-owned account (EOA) and not a contract.
     *
     * Among others, `isContract` will return false for the following
     * types of addresses:
     *
     *  - an externally-owned account
     *  - a contract in construction
     *  - an address where a contract will be created
     *  - an address where a contract lived, but was destroyed
     * ====
     */
    function isContract(address account) internal view returns (bool) {
        // According to EIP-1052, 0x0 is the value returned for not-yet created accounts
        // and 0xc5d2460186f7233c927e7db2dcc703c0e500b653ca82273b7bfad8045d85a470 is returned
        // for accounts without code, i.e. `keccak256('')`
        bytes32 codehash;
        bytes32 accountHash = 0xc5d2460186f7233c927e7db2dcc703c0e500b653ca82273b7bfad8045d85a470;
        // solhint-disable-next-line no-inline-assembly
        assembly {
            codehash := extcodehash(account)
        }
        return (codehash != accountHash && codehash != 0x0);
    }

    /**
     * @dev Replacement for Solidity's `transfer`: sends `amount` wei to
     * `recipient`, forwarding all available gas and reverting on errors.
     *
     * https://eips.ethereum.org/EIPS/eip-1884[EIP1884] increases the gas cost
     * of certain opcodes, possibly making contracts go over the 2300 gas limit
     * imposed by `transfer`, making them unable to receive funds via
     * `transfer`. {sendValue} removes this limitation.
     *
     * https://diligence.consensys.net/posts/2019/09/stop-using-soliditys-transfer-now/[Learn more].
     *
     * IMPORTANT: because control is transferred to `recipient`, care must be
     * taken to not create reentrancy vulnerabilities. Consider using
     * {ReentrancyGuard} or the
     * https://solidity.readthedocs.io/en/v0.5.11/security-considerations.html#use-the-checks-effects-interactions-pattern[checks-effects-interactions pattern].
     */
    function sendValue(address payable recipient, uint256 amount) internal {
        require(
            address(this).balance >= amount,
            "Address: insufficient balance"
        );

        // solhint-disable-next-line avoid-low-level-calls, avoid-call-value
        (bool success, ) = recipient.call{value: amount}("");
        require(
            success,
            "Address: unable to send value, recipient may have reverted"
        );
    }
}

/**
 * @dev Interface of the ERC20 standard as defined in the EIP.
 */
interface IERC20 {
    /**
     * @dev Returns the amount of tokens in existence.
     */
    function totalSupply() external view returns (uint256);

    function decimals() external view returns (uint);

    /**
     * @dev Returns the amount of tokens owned by `account`.
     */
    function balanceOf(address account) external view returns (uint256);

    /**
     * @dev Moves `amount` tokens from the caller's account to `recipient`.
     *
     * Returns a boolean value indicating whether the operation succeeded.
     *
     * Emits a {Transfer} event.
     */
    function transfer(
        address recipient,
        uint256 amount
    ) external returns (bool);

    /**
     * @dev Returns the remaining number of tokens that `spender` will be
     * allowed to spend on behalf of `owner` through {transferFrom}. This is
     * zero by default.
     *
     * This value changes when {approve} or {transferFrom} are called.
     */
    function allowance(
        address owner,
        address spender
    ) external view returns (uint256);

    /**
     * @dev Sets `amount` as the allowance of `spender` over the caller's tokens.
     *
     * Returns a boolean value indicating whether the operation succeeded.
     *
     * IMPORTANT: Beware that changing an allowance with this method brings the risk
     * that someone may use both the old and the new allowance by unfortunate
     * transaction ordering. One possible solution to mitigate this race
     * condition is to first reduce the spender's allowance to 0 and set the
     * desired value afterwards:
     * https://github.com/ethereum/EIPs/issues/20#issuecomment-263524729
     *
     * Emits an {Approval} event.
     */
    function approve(address spender, uint256 amount) external returns (bool);

    /**
     * @dev Moves `amount` tokens from `sender` to `recipient` using the
     * allowance mechanism. `amount` is then deducted from the caller's
     * allowance.
     *
     * Returns a boolean value indicating whether the operation succeeded.
     *
     * Emits a {Transfer} event.
     */
    function transferFrom(
        address sender,
        address recipient,
        uint256 amount
    ) external returns (bool);

    /**
     * @dev Emitted when `value` tokens are moved from one account (`from`) to
     * another (`to`).
     *
     * Note that `value` may be zero.
     */
    event Transfer(address indexed from, address indexed to, uint256 value);

    /**
     * @dev Emitted when the allowance of a `spender` for an `owner` is set by
     * a call to {approve}. `value` is the new allowance.
     */
    event Approval(
        address indexed owner,
        address indexed spender,
        uint256 value
    );
}

/**
 * @dev Implementation of the {IERC20} interface.
 *
 * This implementation is agnostic to the way tokens are created. This means
 * that a supply mechanism has to be added in a derived contract using {_mint}.
 * For a generic mechanism see {ERC20MinterPauser}.
 *
 * TIP: For a detailed writeup see our guide
 * https://forum.zeppelin.solutions/t/how-to-implement-erc20-supply-mechanisms/226[How
 * to implement supply mechanisms].
 *
 * We have followed general OpenZeppelin guidelines: functions revert instead
 * of returning `false` on failure. This behavior is nonetheless conventional
 * and does not conflict with the expectations of ERC20 applications.
 *
 * Additionally, an {Approval} event is emitted on calls to {transferFrom}.
 * This allows applications to reconstruct the allowance for all accounts just
 * by listening to said events. Other implementations of the EIP may not emit
 * these events, as it isn't required by the specification.
 *
 * Finally, the non-standard {decreaseAllowance} and {increaseAllowance}
 * functions have been added to mitigate the well-known issues around setting
 * allowances. See {IERC20-approve}.
 */
contract ERC20Safe is Context, IERC20 {
    using SafeMath for uint256;
    using Address for address;

    mapping(address => uint256) private _balances;

    mapping(address => mapping(address => uint256)) private _allowances;

    uint256 private _totalSupply;

    string private _name;
    string private _symbol;
    uint8 private _decimals;

    /**
     * @dev Sets the values for {name} and {symbol}, initializes {decimals} with
     * a default value of 18.
     *
     * To select a different value for {decimals}, use {_setupDecimals}.
     *
     * All three of these values are immutable: they can only be set once during
     * construction.
     */

    function __ERC20_init(string memory name, string memory symbol) internal {
        _name = name;
        _symbol = symbol;
        _decimals = 18;
    }

    /**
     * @dev Returns the name of the token.
     */
    function name() public view returns (string memory) {
        return _name;
    }

    /**
     * @dev Returns the symbol of the token, usually a shorter version of the
     * name.
     */
    function symbol() public view returns (string memory) {
        return _symbol;
    }

    /**
     * @dev Returns the number of decimals used to get its user representation.
     * For example, if `decimals` equals `2`, a balance of `505` tokens should
     * be displayed to a user as `5,05` (`505 / 10 ** 2`).
     *
     * Tokens usually opt for a value of 18, imitating the relationship between
     * Ether and Wei. This is the value {ERC20} uses, unless {_setupDecimals} is
     * called.
     *
     * NOTE: This information is only used for _display_ purposes: it in
     * no way affects any of the arithmetic of the contract, including
     * {IERC20-balanceOf} and {IERC20-transfer}.
     */
    function decimals() public view override returns (uint) {
        return _decimals;
    }

    /**
     * @dev See {IERC20-totalSupply}.
     */
    function totalSupply() public view override returns (uint256) {
        return _totalSupply;
    }

    /**
     * @dev See {IERC20-balanceOf}.
     */
    function balanceOf(address account) public view override returns (uint256) {
        return _balances[account];
    }

    /**
     * @dev See {IERC20-transfer}.
     *
     * Requirements:
     *
     * - `recipient` cannot be the zero address.
     * - the caller must have a balance of at least `amount`.
     */
    function transfer(
        address recipient,
        uint256 amount
    ) public virtual override returns (bool) {
        _transfer(_msgSender(), recipient, amount);
        return true;
    }

    /**
     * @dev See {IERC20-allowance}.
     */
    function allowance(
        address owner,
        address spender
    ) public view virtual override returns (uint256) {
        return _allowances[owner][spender];
    }

    /**
     * @dev See {IERC20-approve}.
     *
     * Requirements:
     *
     * - `spender` cannot be the zero address.
     */
    function approve(
        address spender,
        uint256 amount
    ) public virtual override returns (bool) {
        _approve(_msgSender(), spender, amount);
        return true;
    }

    /**
     * @dev See {IERC20-transferFrom}.
     *
     * Emits an {Approval} event indicating the updated allowance. This is not
     * required by the EIP. See the note at the beginning of {ERC20};
     *
     * Requirements:
     * - `sender` and `recipient` cannot be the zero address.
     * - `sender` must have a balance of at least `amount`.
     * - the caller must have allowance for ``sender``'s tokens of at least
     * `amount`.
     */
    function transferFrom(
        address sender,
        address recipient,
        uint256 amount
    ) public virtual override returns (bool) {
        _transfer(sender, recipient, amount);
        _approve(
            sender,
            _msgSender(),
            _allowances[sender][_msgSender()].sub(
                amount,
                "ERC20: transfer amount exceeds allowance"
            )
        );
        return true;
    }

    /**
     * @dev Atomically increases the allowance granted to `spender` by the caller.
     *
     * This is an alternative to {approve} that can be used as a mitigation for
     * problems described in {IERC20-approve}.
     *
     * Emits an {Approval} event indicating the updated allowance.
     *
     * Requirements:
     *
     * - `spender` cannot be the zero address.
     */
    function increaseAllowance(
        address spender,
        uint256 addedValue
    ) public virtual returns (bool) {
        _approve(
            _msgSender(),
            spender,
            _allowances[_msgSender()][spender].add(addedValue)
        );
        return true;
    }

    /**
     * @dev Atomically decreases the allowance granted to `spender` by the caller.
     *
     * This is an alternative to {approve} that can be used as a mitigation for
     * problems described in {IERC20-approve}.
     *
     * Emits an {Approval} event indicating the updated allowance.
     *
     * Requirements:
     *
     * - `spender` cannot be the zero address.
     * - `spender` must have allowance for the caller of at least
     * `subtractedValue`.
     */
    function decreaseAllowance(
        address spender,
        uint256 subtractedValue
    ) public virtual returns (bool) {
        _approve(
            _msgSender(),
            spender,
            _allowances[_msgSender()][spender].sub(
                subtractedValue,
                "ERC20: decreased allowance below zero"
            )
        );
        return true;
    }

    /**
     * @dev Moves tokens `amount` from `sender` to `recipient`.
     *
     * This is internal function is equivalent to {transfer}, and can be used to
     * e.g. implement automatic token fees, slashing mechanisms, etc.
     *
     * Emits a {Transfer} event.
     *
     * Requirements:
     *
     * - `sender` cannot be the zero address.
     * - `recipient` cannot be the zero address.
     * - `sender` must have a balance of at least `amount`.
     */
    function _transfer(
        address sender,
        address recipient,
        uint256 amount
    ) internal virtual {
        require(sender != address(0), "ERC20: transfer from the zero address");
        require(recipient != address(0), "ERC20: transfer to the zero address");

        _beforeTokenTransfer(sender, recipient, amount);

        _balances[sender] = _balances[sender].sub(
            amount,
            "ERC20: transfer amount exceeds balance"
        );
        _balances[recipient] = _balances[recipient].add(amount);
        emit Transfer(sender, recipient, amount);
    }

    /** @dev Creates `amount` tokens and assigns them to `account`, increasing
     * the total supply.
     *
     * Emits a {Transfer} event with `from` set to the zero address.
     *
     * Requirements
     *
     * - `to` cannot be the zero address.
     */
    function _mint(address account, uint256 amount) internal virtual {
        require(account != address(0), "ERC20: mint to the zero address");

        _beforeTokenTransfer(address(0), account, amount);

        _totalSupply = _totalSupply.add(amount);
        _balances[account] = _balances[account].add(amount);
        emit Transfer(address(0), account, amount);
    }

    /**
     * @dev Destroys `amount` tokens from `account`, reducing the
     * total supply.
     *
     * Emits a {Transfer} event with `to` set to the zero address.
     *
     * Requirements
     *
     * - `account` cannot be the zero address.
     * - `account` must have at least `amount` tokens.
     */
    function _burn(address account, uint256 amount) internal virtual {
        require(account != address(0), "ERC20: burn from the zero address");

        _beforeTokenTransfer(account, address(0), amount);

        _balances[account] = _balances[account].sub(
            amount,
            "ERC20: burn amount exceeds balance"
        );
        _totalSupply = _totalSupply.sub(amount);
        emit Transfer(account, address(0), amount);
    }

    /**
     * @dev Sets `amount` as the allowance of `spender` over the `owner`s tokens.
     *
     * This is internal function is equivalent to `approve`, and can be used to
     * e.g. set automatic allowances for certain subsystems, etc.
     *
     * Emits an {Approval} event.
     *
     * Requirements:
     *
     * - `owner` cannot be the zero address.
     * - `spender` cannot be the zero address.
     */
    function _approve(
        address owner,
        address spender,
        uint256 amount
    ) internal virtual {
        require(owner != address(0), "ERC20: approve from the zero address");
        require(spender != address(0), "ERC20: approve to the zero address");

        _allowances[owner][spender] = amount;
        emit Approval(owner, spender, amount);
    }

    /**
     * @dev Sets {decimals} to a value other than the default one of 18.
     *
     * WARNING: This function should only be called from the constructor. Most
     * applications that interact with token contracts will not expect
     * {decimals} to ever change, and may work incorrectly if it does.
     */
    function _setupDecimals(uint8 decimals_) internal {
        _decimals = decimals_;
    }

    /**
     * @dev Hook that is called before any transfer of tokens. This includes
     * minting and burning.
     *
     * Calling conditions:
     *
     * - when `from` and `to` are both non-zero, `amount` of ``from``'s tokens
     * will be to transferred to `to`.
     * - when `from` is zero, `amount` tokens will be minted for `to`.
     * - when `to` is zero, `amount` of ``from``'s tokens will be burned.
     * - `from` and `to` are never both zero.
     *
     * To learn more about hooks, head to xref:ROOT:extending-contracts.adoc#using-hooks[Using Hooks].
     */
    function _beforeTokenTransfer(
        address from,
        address to,
        uint256 amount
    ) internal virtual {}

    // uint256[44] private __gap;
}

/**
 * @title SafeERC20
 * @dev Wrappers around ERC20 operations that throw on failure (when the token
 * contract returns false). Tokens that return no value (and instead revert or
 * throw on failure) are also supported, non-reverting calls are assumed to be
 * successful.
 * To use this library you can add a `using SafeERC20 for ERC20;` statement to your contract,
 * which allows you to call the safe operations as `token.safeTransfer(...)`, etc.
 */
library SafeERC20 {
    using SafeMath for uint256;
    using Address for address;

    function safeTransfer(IERC20 token, address to, uint256 value) internal {
        _callOptionalReturn(
            token,
            abi.encodeWithSelector(token.transfer.selector, to, value)
        );
    }

    function safeTransferFrom(
        IERC20 token,
        address from,
        address to,
        uint256 value
    ) internal {
        _callOptionalReturn(
            token,
            abi.encodeWithSelector(token.transferFrom.selector, from, to, value)
        );
    }

    function safeApprove(
        IERC20 token,
        address spender,
        uint256 value
    ) internal {
        // safeApprove should only be called when setting an initial allowance,
        // or when resetting it to zero. To increase and decrease it, use
        // 'safeIncreaseAllowance' and 'safeDecreaseAllowance'
        // solhint-disable-next-line max-line-length
        require(
            (value == 0) || (token.allowance(address(this), spender) == 0),
            "SafeERC20: approve from non-zero to non-zero allowance"
        );
        _callOptionalReturn(
            token,
            abi.encodeWithSelector(token.approve.selector, spender, value)
        );
    }

    function safeIncreaseAllowance(
        IERC20 token,
        address spender,
        uint256 value
    ) internal {
        uint256 newAllowance = token.allowance(address(this), spender).add(
            value
        );
        _callOptionalReturn(
            token,
            abi.encodeWithSelector(
                token.approve.selector,
                spender,
                newAllowance
            )
        );
    }

    function safeDecreaseAllowance(
        IERC20 token,
        address spender,
        uint256 value
    ) internal {
        uint256 newAllowance = token.allowance(address(this), spender).sub(
            value,
            "SafeERC20: decreased allowance below zero"
        );
        _callOptionalReturn(
            token,
            abi.encodeWithSelector(
                token.approve.selector,
                spender,
                newAllowance
            )
        );
    }

    /**
     * @dev Imitates a Solidity high-level call (i.e. a regular function call to a contract), relaxing the requirement
     * on the return value: the return value is optional (but if data is returned, it must not be false).
     * @param token The token targeted by the call.
     * @param data The call data (encoded using abi.encode or one of its variants).
     */
    function _callOptionalReturn(IERC20 token, bytes memory data) private {
        // We need to perform a low level call here, to bypass Solidity's return data size checking mechanism, since
        // we're implementing it ourselves.

        // A Solidity high level call has three parts:
        //  1. The target address is checked to verify it contains contract code
        //  2. The call itself is made, and success asserted
        //  3. The return value is decoded, which in turn checks the size of the returned data.
        // solhint-disable-next-line max-line-length
        require(address(token).isContract(), "SafeERC20: call to non-contract");

        // solhint-disable-next-line avoid-low-level-calls
        (bool success, bytes memory returndata) = address(token).call(data);
        require(success, "SafeERC20: low-level call failed");

        if (returndata.length > 0) {
            // Return data is optional
            // solhint-disable-next-line max-line-length
            require(
                abi.decode(returndata, (bool)),
                "SafeERC20: ERC20 operation did not succeed"
            );
        }
    }
}

contract Governable {
    address public governor;

    event GovernorshipTransferred(
        address indexed previousGovernor,
        address indexed newGovernor
    );

    modifier governance() {
        require(msg.sender == governor);
        _;
    }

    /**
     * @dev Allows the current governor to relinquish control of the contract.
     * @notice Renouncing to governorship will leave the contract without an governor.
     * It will not be possible to call the functions with the `governance`
     * modifier anymore.
     */
    function renounceGovernorship() public governance {
        emit GovernorshipTransferred(governor, address(0));
        governor = address(0);
    }

    /**
     * @dev Allows the current governor to transfer control of the contract to a newGovernor.
     * @param newGovernor The address to transfer governorship to.
     */
    function transferGovernorship(address newGovernor) public governance {
        _transferGovernorship(newGovernor);
    }

    /**
     * @dev Transfers control of the contract to a newGovernor.
     * @param newGovernor The address to transfer governorship to.
     */
    function _transferGovernorship(address newGovernor) internal {
        require(newGovernor != address(0));
        emit GovernorshipTransferred(governor, newGovernor);
        governor = newGovernor;
    }
}

contract WhiteList is Governable, ReentrancyGuard {
    using SafeMath for uint;
    using SafeERC20 for IERC20;

    uint public constant contractType = 1;
    IERC20 public currency;
    IERC20 public token;
    uint public price;
    uint public feeRatio;
    address payable public recipient;
    address payable public feeOwner;
    uint public timeOffer;
    uint public timeClaim;

    uint public totalUsdtQuota;
    uint public totalOffered;
    uint public totalClaimed;
    uint public minUsdtTotalOffered;
    uint public totalUsdtTotalOffered;

    uint public minUsdtPersonOffered;
    mapping(address => uint) public minUsdtPersonOf;

    mapping(address => uint) public quotaUsdtOf;
    mapping(address => uint) public offeredOf;
    mapping(address => uint) public offeredUsdtOf;
    mapping(address => uint) public claimedOf;

    event Offer(address indexed addr, uint amount, uint volume, uint total);
    event Claim(address indexed addr, uint volume, uint total);
    event Revert(
        address indexed addr,
        uint volume,
        uint volumeUsdt,
        uint total
    );
    event WithdrawCurrency(
        address indexed addr,
        uint balance,
        uint recipientBalance
    );

    //  (price_  feeRatio_ )  mul 10**18  minUsdtTotalOffered_  mul 10**6
    constructor(
        address governor_,
        address currency_,
        address token_,
        uint price_,
        address payable recipient_,
        address payable feeOwner_,
        uint feeRatio_,
        uint timeOffer_,
        uint timeClaim_,
        uint minUsdtTotalOffered_,
        uint minUsdtPersonOffered_
    ) public {
        require(timeClaim_ > timeOffer_, "timeClaim_ should >= timeOffer_");
        require(price_ > 0, "price should gt 0");

        require(governor_ != address(0), "governor_ zero address");
        // require(currency_ != address(0), "currency_ zero address");
        require(token_ != address(0), "token_ zero address");
        require(feeOwner_ != address(0), "feeOwner_ zero address");
        require(recipient_ != address(0), "recipient_ zero address");

        _transferGovernorship(governor_);
        currency = IERC20(currency_);
        token = IERC20(token_);

        price = price_;
        recipient = recipient_;
        timeOffer = timeOffer_;
        timeClaim = timeClaim_;
        feeRatio = feeRatio_;
        feeOwner = feeOwner_;

        minUsdtTotalOffered = minUsdtTotalOffered_;
        minUsdtPersonOffered = minUsdtPersonOffered_;
    }

    event SetMinUsdtTotalOffered(address indexed acct, uint amount);

    function setMinUsdtTotalOffered(
        uint minUsdtTotalOffered_
    ) public governance {
        require(minUsdtTotalOffered_ > 0, "minUsdtTotalOffered_ should gt 0");
        minUsdtTotalOffered = minUsdtTotalOffered_;
        emit SetMinUsdtTotalOffered(msg.sender, minUsdtTotalOffered_);
    }

    event SetFeeOwner(address indexed acct, address add);

    function setFeeOwner(address payable feeOwner_) public governance {
        require(feeOwner_ != address(0), "feeOwner_ zero address");
        feeOwner = feeOwner_;

        emit SetFeeOwner(msg.sender, feeOwner_);
    }

    event SetFeeRatio(address indexed acct, uint amount);

    function setFeeRatio(uint feeRatio_) public governance {
        feeRatio = feeRatio_;

        emit SetFeeRatio(msg.sender, feeRatio_);
    }

    event SetTimeOffer(address indexed acct, uint amount);

    function setTimeOffer(uint timeOffer_) public governance {
        require(timeClaim > timeOffer_, "timeClaim_ should >= timeOffer_");
        timeOffer = timeOffer_;
        emit SetTimeOffer(msg.sender, timeOffer_);
    }

    event SetTimeClaim(address indexed acct, uint amount);

    function setTimeClaim(uint timeClaim_) public governance {
        require(timeClaim_ > timeOffer, "timeClaim_ should >= timeOffer_");
        timeClaim = timeClaim_;
        emit SetTimeClaim(msg.sender, timeClaim_);
    }

    // function setPrice(uint price_) public governance {
    //    price = price_;
    // }

    event SetRecipient(address indexed acct, address add);

    function setRecipient(address payable recipient_) public governance {
        require(recipient_ != address(0), "recipient_ zero address");
        recipient = recipient_;
        emit SetRecipient(msg.sender, recipient_);
    }

    function setQuota(address addr, uint amount) public governance {
        // uint amount =amount_.mul(10**currency.decimals());
        require(amount >= getMinUsdtPersonOf(addr), "Quota should gt min");
        totalUsdtQuota = totalUsdtQuota.add(amount).sub(quotaUsdtOf[addr]);
        quotaUsdtOf[addr] = amount;
        emit Quota(addr, amount, totalUsdtQuota);
    }

    event Quota(address indexed addr, uint amount, uint total);

    function setQuotas(address[] calldata addrs, uint amount) external {
        for (uint i = 0; i < addrs.length; i++) setQuota(addrs[i], amount);
    }

    function setQuotas(
        address[] calldata addrs,
        uint[] calldata amounts
    ) external {
        require(addrs.length == amounts.length);
        for (uint i = 0; i < addrs.length; i++) setQuota(addrs[i], amounts[i]);
    }

    function setMinUsdtPersonOffered(
        address addr,
        uint amount
    ) public governance {
        minUsdtPersonOf[addr] = amount;
        emit MinUsdtPersonOffered(addr, amount);
    }

    event MinUsdtPersonOffered(address indexed addr, uint amount);

    function setMinUsdtPersonOffereds(
        address[] calldata addrs,
        uint amount
    ) external {
        for (uint i = 0; i < addrs.length; i++)
            setMinUsdtPersonOffered(addrs[i], amount);
    }

    function setMinUsdtPersonOffereds(
        address[] calldata addrs,
        uint[] calldata amounts
    ) external {
        require(addrs.length == amounts.length);
        for (uint i = 0; i < addrs.length; i++)
            setMinUsdtPersonOffered(addrs[i], amounts[i]);
    }

    function getMinUsdtPersonOf(
        address addr
    ) public view returns (uint amount) {
        uint min = minUsdtPersonOf[addr];
        if (min > 0) {
            return min;
        }

        return minUsdtPersonOffered;
    }

    // usdt amount
    function offer(uint amount) external payable nonReentrant {
        // require(
        //     address(currency) != address(0),
        //     "should call offerEth() instead"
        // );
        require(tx.origin == msg.sender, "only account");
        require(now >= timeOffer, "it's not time yet");
        require(now < timeClaim, "expired");
        require(offeredOf[msg.sender] == 0, "offered already");

        if (address(currency) != address(0)) {
            require(
                currency.allowance(msg.sender, address(this)) >= amount,
                "allowance not enough"
            );
            require(
                currency.balanceOf(msg.sender) >= amount,
                "balance not enough"
            );
        } else {
            amount = msg.value;
        }

        require(
            amount > getMinUsdtPersonOf(msg.sender),
            "amount should gt MinUsdtPersonOf"
        );

        require(amount <= quotaUsdtOf[msg.sender], "should gt quota");
        // amount = Math.min(amount, quotaUsdtOf[msg.sender]);
        require(amount > 0, "no quota");

        //currency.safeTransferFrom(msg.sender, recipient, amount);
        // currency.safeTransferFrom(msg.sender, address(this), amount);
        offeredUsdtOf[msg.sender] = amount;
        // uint volume = amount.div(price).mul(10**token.decimals()).div(10**currency.decimals()).mul(1e18);
        // price_ : (USDT:T) * 1e18  * 10**curDec / 10 ** tokenDec
        //uint volume = amount.div(price).mul(1e18);
        uint volume = amount.mul(1e18).div(price);
        offeredOf[msg.sender] = volume;

        totalUsdtTotalOffered = totalUsdtTotalOffered.add(amount);
        totalOffered = totalOffered.add(volume);
        require(
            totalOffered <= token.balanceOf(address(this)),
            "Quota is full"
        );
        if (address(currency) != address(0)) {
            currency.safeTransferFrom(msg.sender, address(this), amount);
        }

        emit Offer(msg.sender, amount, volume, totalOffered);
    }

    // token amount
    function claim() public nonReentrant {
        require(now >= timeClaim, "it's not timeClaim yet");
        require(claimedOf[msg.sender] == 0, "claimed already");
        require(offeredUsdtOf[msg.sender] > 0, "offered Usdt should gt 0");
        // if(token.balanceOf(address(this)).add(totalClaimed) > totalOffered)
        // 	token.safeTransfer(recipient, token.balanceOf(address(this)).add(totalClaimed).sub(totalOffered));

        if (minUsdtTotalOffered <= totalUsdtTotalOffered) {
            require(
                token.balanceOf(address(this)) >=
                    totalOffered.sub(totalClaimed),
                " offered token number should not gt balanace!"
            );
            uint volume = offeredOf[msg.sender];
            claimedOf[msg.sender] = volume;
            totalClaimed = totalClaimed.add(volume);
            token.safeTransfer(msg.sender, volume);
            emit Claim(msg.sender, volume, totalClaimed);
        } else {
            if (address(currency) == address(0)) {
                require(
                    currency.balanceOf(address(this)) >= totalUsdtTotalOffered,
                    " offered Usdt number should not gt balanace!"
                );
            } else {
                require(
                    address(this).balance >= totalUsdtTotalOffered,
                    " offered Usdt number should not gt balanace!"
                );
            }

            uint volumeUsdt = offeredUsdtOf[msg.sender];
            uint volume = offeredOf[msg.sender];

            offeredUsdtOf[msg.sender] = 0;
            offeredOf[msg.sender] = 0;
            totalOffered = totalOffered.sub(volume);
            totalUsdtTotalOffered = totalUsdtTotalOffered.sub(volumeUsdt);
            //Revert USDT/ETH
            if (address(currency) == address(0))
                msg.sender.transfer(volumeUsdt);
            else currency.safeTransfer(msg.sender, volumeUsdt);
            emit Revert(msg.sender, volume, volumeUsdt, totalOffered);
        }
    }

    /// @notice This method can be used by the owner to extract mistakenly
    ///  sent tokens to this contract.
    /// @param _token The address of the token contract that you want to recover
    function rescueTokens(address _token, address _dst) public governance {
        uint balance = IERC20(_token).balanceOf(address(this));
        IERC20(_token).safeTransfer(_dst, balance);
    }

    function withdrawToken(address _dst) external governance {
        rescueTokens(address(token), _dst);
    }

    function withdrawToken() external governance {
        rescueTokens(address(token), msg.sender);
    }

    function withdrawCurrencyToken() external governance {
        require(now >= timeClaim, "It is not timeClaim yet");
        require(totalUsdtTotalOffered >= minUsdtTotalOffered);

        uint balance = 0;
        uint feeBalance = 0;
        uint recipientBalance = 0;
        if (address(currency) == address(0)) {
            balance = address(this).balance;
            feeBalance = balance.mul(feeRatio).div(1e18);
            recipientBalance = balance.sub(feeBalance);
            (bool success, ) = recipient.call{value: recipientBalance}("");
            if (!success) {
                revert("recipient fail");
            }
            (success, ) = feeOwner.call{value: feeBalance}("");
            if (!success) {
                revert("fee fail");
            }
        } else {
            balance = currency.balanceOf(address(this));
            feeBalance = balance.mul(feeRatio).div(1e18);
            recipientBalance = balance.sub(feeBalance);
            currency.safeTransfer(recipient, recipientBalance);
            currency.safeTransfer(feeOwner, feeBalance);
        }

        emit WithdrawCurrency(recipient, balance, recipientBalance);
    }

    // function withdrawEth(address payable _dst) external governance {
    //     _dst.transfer(address(this).balance);
    // }

    // function withdrawEth() external governance {
    //     msg.sender.transfer(address(this).balance);
    // }

    fallback() external {
        claim();
    }
}
