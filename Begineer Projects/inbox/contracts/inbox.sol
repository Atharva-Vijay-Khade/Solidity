pragma solidity ^0.4.17;

contract inbox {

    string public message;

    function Inbox(string initialMessage) public {
        message = initialMessage;
    }

    function SetMessage(string newMessage) public {
        message = newMessage;
    }
    
}

