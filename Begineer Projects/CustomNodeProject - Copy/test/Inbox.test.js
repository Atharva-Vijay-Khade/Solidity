const ganache = require('ganache-cli');
const assert = require('assert');
const Web3 = require('web3');
const web3 = new Web3(ganache.provider());
const {interface,bytecode} = require('../compile');

let accounts;
let inbox;

beforeEach( async ()=>{

    accounts = await web3.eth.getAccounts();

    inbox = await new web3.eth.Contract(JSON.parse(interface))
    .deploy({data : bytecode,arguments : ["Hey There!"]})
    .send({from : accounts[0], gas : 1000000})
    
});

describe('Testing The Inbox', ()=>{

    it('Testing Account Address',()=>{
        assert.ok(inbox.options.address);
    });

    it('Testing The Accounts',()=>{
        console.log(accounts);
    });

    it('Testing Initial Message', async ()=>{
        const message = await inbox.methods.message().call();
        assert.equal(message,"Hey There!");
    });

    it('Testing Message Changes', async ()=>{
        await inbox.methods.SetMessage("Bye!").send({ from : accounts[0] });
        const newMsg = await inbox.methods.message().call();
        assert(newMsg,"Bye!");
    });

});