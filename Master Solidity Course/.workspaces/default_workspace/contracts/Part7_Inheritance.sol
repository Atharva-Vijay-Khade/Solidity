pragma solidity ^0.6.0;

// this is very common pattern in solidity for blockchain development
// multiple smart contract can use this Ownable contract

contract Ownable {
    
    address owner;
    
    constructor() public {
        owner = msg.sender;
    }
    
    modifier onlyOwner() {
        require(msg.sender==owner,"Must be Owner");
        _;
    }
    
}


contract SecretVault {
    string secret;
    
    constructor(string memory _secret) public {
        secret=_secret;
    }
    
    function getSecret() public view returns(string memory) {
        return secret;
    }
    
}


// inheriting from Ownable contract
// basically we have created an ownership 
// contract which we can use to keep keep onwership track
// so we want that the secret string should be only visible 
// to the owner and not to other accounts, also when the 
// contract is deployed the owner should be assigned

contract MyContract is Ownable {
    
    // Inheritance
    // Factories
    // Smart Contract Interactions
    // this contract holds a secret value
    // and allow user to return this secret value
    
    address secretVault;

    constructor(string memory _secret) public {
        SecretVault _secretVault = new SecretVault(_secret);
        secretVault = address(_secretVault);
        super;
    }
    
    function getSecret() public view onlyOwner returns(string memory) {
        SecretVault _secretVault = SecretVault(secretVault);
        return _secretVault.getSecret();
    }
    
}