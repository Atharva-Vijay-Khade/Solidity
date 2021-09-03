pragma solidity ^0.6.0;

contract MyContract {
    
    // Arrays -> List of information in order
    // creation of basic array in solidity
    uint[] public uintArray = [1,2,3];
    // arrays are 0 based indexed
    // this is an array of usigned intergers
    
    // array of strings 
    string[] public stringArray = ["apple","banana","carrot"];
    string[] public myArray;
    
    // 2D Arrays
    uint[][] public array2D = [[1,2,3],[4,5,6]];
    
    function addValue(string memory _value) public {
        myArray.push(_value);
    }
    
    function valueCount() public view returns(uint){
        return myArray.length;
    }
    
}