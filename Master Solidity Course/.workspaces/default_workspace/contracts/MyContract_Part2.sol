pragma solidity ^0.6.0;

contract MyContract {   
    
    // Variables 
    // State Variables , Local Variables
    
    // State Variable -> actually stored on blockchain itself 
    // types of state variables 
    // int, uint, etc
    // Local Variables -> way to store info 
    // to reuse inside a function
    
    // Data type: uint,int,uint256,uint8
    uint public myUint = 1;   // can't be negative
    int public myInt = 1;    // can be negative also
    uint256 public myUint256 = 1; // types of unsigned interger, specify the size of the number
    uint8 public myuint6 = 1;     // different spaced number are used to improve performance wrt to space on BC
    // uint and uint256 are same, uint = uint256 
    
    // other data types: Strings
    string public myString = "Hello World!";
    // more space optimized
    bytes32 public myBytes32 = "Hello World!"; // optimizing smartContracts for BC to work more faster and optimize space
    
    
    // another data type: Address
    // each smart contract has an address and users also have
    // addresses
    address public myAddress = 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4;
    
    // custom data types / data structures { way to create our own data types }
    // declaration of struct
    struct Person {
        uint id;
        string name;
        string ballot;
    }
    
    // defining a struct
    Person public person1 = Person(1,"avk","Hello world");
    
    function getMyUnit() public view returns(uint){
        return myUint;
    }
    
    function getValue() public pure returns(uint) {
        // local variable of type unsigned integer
        uint value = 1;
        return value;
    }
    
    function getString() public view returns(string memory){
        return myString;
    }
}