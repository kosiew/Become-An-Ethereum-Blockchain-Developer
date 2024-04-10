// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

/**
 * @title ReentrancyGuard
 * Provides a modifier to prevent reentrancy attacks.
 */
abstract contract ReentrancyGuard {
    // Variable that indicates if the contract is currently in a function call
    bool private _entered;

    modifier nonReentrant() {
        // Ensure the function hasn't been entered previously
        require(!_entered, "ReentrancyGuard: reentrant call");

        // Mark as entered
        _entered = true;

        // Execute the function
        _;

        // Reset the entered state
        _entered = false;
    }
}

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SecureWallet is ReentrancyGuard {
    address public owner;
    mapping(address => uint256) public allowance;
    mapping(address => bool) public isGuardian;
    mapping(address => bool) public approvedOwnershipChange;
    uint256 public approvalCount;
    uint256 public constant requiredApprovals = 3;
    address public pendingOwner;

    constructor(address[] memory guardians) {
        require(guardians.length == 5, "Must initialize with 5 guardians");
        owner = msg.sender;
        for (uint256 i = 0; i < guardians.length; i++) {
            isGuardian[guardians[i]] = true;
        }
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Caller is not the owner");
        _;
    }

    modifier onlyGuardian() {
        require(isGuardian[msg.sender], "Caller is not a guardian");
        _;
    }

    function setAllowance(address _to, uint256 _amount) public onlyOwner {
        allowance[_to] = _amount;
    }

    function spendMoney(
        address payable _to,
        uint256 _amount
    ) public nonReentrant {
        require(
            msg.sender == owner || allowance[msg.sender] >= _amount,
            "Not allowed or insufficient allowance"
        );
        if (msg.sender != owner) {
            allowance[msg.sender] -= _amount;
        }

        // Checks-Effects-Interactions pattern
        // 1. Checks: The require statements above
        // 2. Effects: Updating the state (allowance) before the external call
        (bool sent, ) = _to.call{value: _amount}("");
        require(sent, "Failed to send Ether");
        // 3. Interactions: The external call is the last operation
    }

    function proposeNewOwner(address _newOwner) public onlyGuardian {
        require(pendingOwner != _newOwner, "Owner proposal already in process");
        pendingOwner = _newOwner;
        approvalCount = 0;
        for (uint256 i = 0; i < 5; i++) {
            approvedOwnershipChange[_newOwner] = false;
        }
    }

    function approveNewOwner() public onlyGuardian {
        require(pendingOwner != address(0), "No pending owner");
        require(
            !approvedOwnershipChange[msg.sender],
            "Guardian already approved"
        );

        approvedOwnershipChange[msg.sender] = true;
        approvalCount++;

        if (approvalCount >= requiredApprovals) {
            owner = pendingOwner;
            pendingOwner = address(0);
        }
    }

    receive() external payable {}
}
