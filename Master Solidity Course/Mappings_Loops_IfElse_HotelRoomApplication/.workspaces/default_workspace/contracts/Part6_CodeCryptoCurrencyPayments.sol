pragma solidity ^0.6.0;

// creating a hotel booking crypto currency payments application

contract HotelRoom {
    
    // application is, user will book a room based on vaccant and non vaccant status
    // once booked owner will be automatically be paid amoutns in ethers
    // and rooms will automatically open
    
    // Learning 
    // how to 
    // - work with ethers { pay smart contracts }
    // - modifiers
    // - Visibility
    // - Events
    // - Enums

    // working is such that the owner of the smart contract
    // the creator of the smart contract gets paid when 
    // hotel room is booked
    // booking person will send the ethers to smart contract and smart contract will
    // send the ethers to owner
    
    enum Statuses { booked , vacant }  // enum keeps collection of options which never changes 
    // we can reference the collection of options by Statuses currentStatuses; => currentStatuses = Statuses.vacant;
    Statuses currentStatuses;

    
    // payable to allow the owner to receive the currency
    // public because we can check the ownership
    address payable public owner;  // owner of the smart contract
    
    // constructor is called when smart contract is created, deployed
    constructor() public {
        // msg.sender gets the ethereum address of the user who is calling this function
        // here it's essentially the creator it self as it's a constructor
        owner = msg.sender;
        currentStatuses = Statuses.vacant;  // set default status of room as vacant
    }
    
    
    // Events 
    // Events allow external consumer to subscribe to them and find out that something happened in smartContract
    // ie : smart lock that actually unlocks hotel room and listens to events on blockchain we can use Events
    
    // we will create an event which will get emited when a person pays a value and get the check status valid
    // and will now subscribe and get a key to the room or something like that 
    
    event Booked(address _occupant,uint value);
    
    
    // this functio is payable because we are transfering the 
    // value in ether to the owner of the smart contract
    // but we want to keep track of booked and vacant rooms
    // for that we can Enums
    
    
    // modifiers comes in handy when there are lots of functions with duplications
    // like each function may have checks like check price and check status
    // so we can abstract out the details of that using modifiers and use it 
    // only once in each function
    
    modifier onlyWhileVacant {
        require(currentStatuses == Statuses.vacant,"Currently Room is Booked");
        _;    // _ means after the above lines/conditions are met the function with this modifier will run
    }
    
    modifier cost(uint _amount){
        require(msg.value >= _amount ,"Not Enough Ether Provided");
        _;
    }
    
    // well this book function would be required to be called for it work
    // but we want that when this smart contract gets the ethers it should 
    // automatically call this book function for that we have 
    // receive() in solidity
    // receive() creates a function that will get triggered when we pay the smart contract
    // if you send ethers at the address of the smart contract then receive will create a 
    // function and it will automatically run it 
    // so REPLACING function book() ..... with receive
    // external -> so that function can be called from outside
    
    receive() external payable onlyWhileVacant cost(2 ether) {
        // well here first we need to check if room was booked already or not
        // and was the amount paid equal to what was mentioned 
        // if both conditions met then only we can move ahead with the code for transfer and 
        // change of statuses
        // for that solidity provides us with require(); function 
        
        // require()
        
        //- check price 
        // check the price provided is as mentioned or not
        // require(msg.value >= 2 ether ,"Not Enough Ether Provided");
        
        //- check status
        // it checks the condition which is the requirement 
        // if yes then goes ahead with the code if no then displays the error message to
        // user, and reverts all the transactions to the user without any middle person
        // require(currentStatuses == statuses.vacant,"Currently Room is Booked"); 
        currentStatuses = Statuses.booked;
        owner.transfer(msg.value);
        emit Booked(msg.sender,msg.value);
    }
    
    
    
}