// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract HotelRoom{
    //  payable : modifier that lets a address receive ethereum 
    // consrtuctot function runs only once after placing this contract on the blockchain
    event Occupy(address _occupant, uint _value);
    address payable owner;
    constructor(){
        owner = payable(msg.sender);
        currentStatus = Statuses.Vacant;
    }

    // there'll be two statuses for the hotelroom :
    // vacant or Occupied
    // enums are collection of options that never gonna change 
    enum Statuses{
        Vacant ,
        Occupied
    }
    // currentStatus is of type Statuses
    Statuses currentStatus ;
    // ether payments 
    // modifiers
    // visibility 
    // events
    // enums


    // pay the person who created the smart contract
    modifier onlyWhileVacant{
        require(currentStatus == Statuses.Vacant, "Currently Occupied");
        _;
    }

    modifier costs(uint _amount){
        require(msg.value >= _amount, "not enough ether provided");
        _;
    }
    // there is this function called require() in the contract .
    // require(1+1 == 2) gives out true
    // require(1+1 == 3) gives out false
    // if a line has require() and it returns false , that function won't procedd forward , that function will break
    // if line 40 is true, then we'll go forward and run the other lines , if it's wrong , then we'll break the function and won'y proceed forward 
    function book() payable public onlyWhileVacant costs(2 ether){
        // check prices
        // check status
        currentStatus = Statuses.Occupied;
        // owner.transfer(msg.value);
        (bool sent, bytes memory data) = owner.call{value : msg.value}("");
        require(true);
        emit Occupy(msg.sender, msg.value);
    }
}