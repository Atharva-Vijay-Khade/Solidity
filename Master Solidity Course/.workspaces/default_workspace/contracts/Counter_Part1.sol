pragma solidity ^0.6.0;

contract Counter {  
    
    // 1,2,3,... unsigned integer { can't be negative }
    uint public count = 1;
    
    // // creates reusable code, which perform some action
    // function getCount() public view returns(uint) {
    //     return count;
    // }
    
    function incrementCount() public {
        count++;
    }
    
}