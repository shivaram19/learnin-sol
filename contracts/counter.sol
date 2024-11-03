// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Counter {
    // code goes here for the contract Counter
    uint count;
// special function in tge contract that gets runned only once when we put on the blockchainn / de[lyed yo the blockchain
    constructor() public {
        count = 0;
    }

    function getCount() public view returns (uint){
        return count;
    }
    function incrementCount() public {
        count = count + 1;
    }
}

// state variable is the varible that gets tored pn the blockchain


