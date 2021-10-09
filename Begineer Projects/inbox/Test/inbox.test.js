const assert = require('assert');
const ganache = require('ganache-cli');
const Web3 = require('web3');
const {interface, bytecode} = require('../compile');
const web3 = new Web3(ganache.provider());
const INITIAL_STRING = 'Hello there!';

let accounts; // let allows the accounts reference to get assigned to different objects each time as beforeEach runs before each 
let inbox;  // before each it{makes assertions} statement, the beforeEach runs, so this gets reassigned

beforeEach( async ()=>{
    // get all accounts using web3 instance 
    // web3.eth.getAccounts().then( fetchedAcc => {
    //     console.log(fetchedAcc);
    // });
    accounts = await web3.eth.getAccounts();
    inbox = await new web3.eth.Contract(JSON.parse(interface))
                .deploy({data:bytecode, arguments: [INITIAL_STRING]})
                .send({from:accounts[0],gas:"1000000"});

});

describe('Testing accounts', ()=>{  
    it('Is the contract deployed correctly',()=>{
        // this to check if the contract is deployed and it gets a valid address
        assert.ok(inbox.options.address);
    });

    // now we check that the message variable in the contract gets 
    // initialized properly or not 
    it('checking message varibale',async ()=>{
        //console.log(inbox);
        const message = await inbox.methods.message().call();
        assert.equal(message,INITIAL_STRING);
    });

    // now testing the setMessage
    it('testing setMessage', async ()=>{
        await inbox.methods.SetMessage('Bye').send({from : accounts[0]});
        const message = await inbox.methods.message().call();
        assert.equal(message,'Bye');
    });
});



// it('Testing mocha it1',()=>{
//     console.log("I get the list but I don't print it");
// })
// it('Tesing the accounts',()=>{
//     console.log(inbox);
// })

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
