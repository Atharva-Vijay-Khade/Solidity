pragma solidity ^0.6.0;

contract myContract {
    
    uint[] public numbers = [1,2,3,4,5,6,7,8,9,10];
    
    address public owner;
    
    // to detect owner ship of the creator of this contract we
    // know that constructor is called when the contract is deployed
    // so we store the address of the owner during deploying of smart contract
    // and to check owner ship call isOwner function
    
    // binding real owner with "owner" when smart contract is deployed
    constructor() public {
        owner = msg.sender;
    }
    
    function iterate() public view returns(uint) {
        uint count = 0;
        for(uint i=0;i<numbers.length;i++)
            if(isEven(numbers[i]))
                count++;
        return count;
    }
    
    function isEven(uint _num) public pure returns(bool){
        if(_num % 2 == 0)
            return true;
        else 
            return false;
    }
    
    function isOwner() public view returns(bool){
        return (msg.sender==owner);
    }
    
}