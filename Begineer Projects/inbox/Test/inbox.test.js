const assert = require('assert');
const ganache = require('ganache-cli');
const Web3 = require('web3');
const {interface, bytecode} = require('../compile');

const web3 = new Web3(ganache.provider());


let accounts;
let inbox;

beforeEach( async ()=>{
    // get all accounts using web3 instance 
    // web3.eth.getAccounts().then( fetchedAcc => {
    //     console.log(fetchedAcc);
    // });
    accounts = await web3.eth.getAccounts();
    inbox = await new web3.eth.Contract(JSON.parse(interface))
                .deploy({data:bytecode, arguments: ['Hello there!']})
                .send({from:accounts[0],gas:"1000000"});

});

describe('Testing accounts',()=>{
    it('Testing mocha it1',()=>{
        console.log("I get the list but I don't print it");
    })
    it('Tesing the accounts',()=>{
        console.log(inbox);
    })
});



// testing using mocha 
// class Car {
//     drive(){
//         return "driving";
//     }
//     stop(){
//         return "stopping";
//     }
// }

// let car;

// beforeEach(()=>{
//     car = new Car();
// });

// describe('Testing it statements',()=>{
//     it('in it1 : testing drive',()=>{
//         assert.equal(car.drive(),"driving")
//     });
//     it('in it2 : testing stop',()=>{
//         assert.equal(car.stop(),'stopping');
//     });
// });
