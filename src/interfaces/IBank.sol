// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

interface IBank {

    enum LockState {
        LOCKED,
        UNLOCKED
    }

    struct Lock {
        uint256 balance;
        uint256 lockTime;
        uint256 unlockTime;
        // bool isValid;
        LockState state;
    }

    function lock(uint256) external payable virtual;
    function unlock(uint256) external;

}