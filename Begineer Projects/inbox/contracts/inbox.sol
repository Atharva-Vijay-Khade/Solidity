pragma solidity ^0.4.17;

contract inbox {

    string public message;

    function inbox(string initialMessage) public {
        message = initialMessage;
    }

    function SetMessage(string newMessage) public {
        message = newMessage;
    }
    
}

