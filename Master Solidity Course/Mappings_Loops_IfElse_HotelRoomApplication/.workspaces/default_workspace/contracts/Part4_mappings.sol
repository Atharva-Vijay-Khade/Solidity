pragma solidity ^0.6.0;

contract Mappings {
    
    // this is a map in solidity { key => value }
    mapping(uint=>string) public names;
    struct Book {
        uint id;
        string name;
        string author;
    }
    mapping(uint=>Book) public books;
    
    // we can create a mapping of mappings 
    // used when we want to model books for each user 
    // used when we want to model any map for any other user or user address
    // say I want to allow user to add book, and I'll store it according to it's address
    // means add1-> id1,{map for book 1}, id2, {map for book 2} and so on 
    // ultimately we can model a data Base 
    mapping(address=>mapping(uint=>Book)) public dataBase;  // nested maps
    
    constructor() public {
        names[0]="Tom";
        names[1]="Ron";
        names[2]="Shaun";
    }
    
    function addBook(uint id,string memory name,string memory author) public {
        // way to add book to map and creation of a book { imp }
        books[id]=Book(id,name,author);
    }
    
    // msg.sender to get ethereum address of the caller 
    function addBookDb(uint _id,string memory _name,string memory _author) public {
        dataBase[msg.sender][_id] = Book(_id,_name,_author);
    }
    
}