// SPDX-License-Identifier: MIT
pragma solidity ^0.8.16;


constract SampleUnits {
    modifier betweenOneAndTwoEthers() {
        require(msg.value >= 1 ether && msg.value <= 2 ether, "Value is not between 1 and 2 ethers");
        _;
    }
    // other units gwei, wei

    uint runUntilTimestamp;
    unit startTimestamp;

    constructor(uint startInDays) {
        startTimestamp = block.timestamp + (startInDays * 1 days);
        runUntilTimestamp = startTimestamp + (30 days);
    }
    // other units seconds, minutes, hours, weeks
    // no years
}