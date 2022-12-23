// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "./interfaces/IBank.sol";

contract Bank is IBank {



    // LockState public state = LockState.LOCKED;

    // uint256 public userCount;
    uint256 public constant MIN_LOCK_TIME = 3 days;

    mapping(address => mapping (uint256 => Lock)) public locks;
    mapping(address => uint256) public lockIds;

    function lock(uint256 _unlockTime) external payable {

        require(_unlockTime > block.timestamp, "Unlock time must be > block.timestamp");
        require(_unlockTime >= MIN_LOCK_TIME + block.timestamp, "Unlock time must be > MIN_LOCK_TIME");

        uint256 id = lockIds[msg.sender];
        locks[msg.sender][id] = Lock(
            msg.value,
            block.timestamp,
            _unlockTime,
            LockState.LOCKED
            // true
        );

        lockIds[msg.sender]++;
    }

    function unlock(uint256 id) external {

        Lock storage user = locks[msg.sender][id];

        require(user.state == LockState.LOCKED, "Id is not valid!");
        require(user.unlockTime >= block.timestamp, "Money is locked!");
        // require(locks[msg.sender][id] != Lock(0, 0, 0, false));
        // address(0); zero address
        // Lock memory user = locks[msg.sender];

        // user.isValid = false
        user.state = LockState.UNLOCKED;

        payable(msg.sender).transfer(user.balance);
        
    }

}