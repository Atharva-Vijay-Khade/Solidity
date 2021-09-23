const assert = require('assert');
const ganache = require('ganache-cli');
const Web3 = require('web3');

const web3 = new Web3(ganache.provider());

// testing using mocha 

class Car {
    drive(){
        return "driving";
    }
    stop(){
        return "stopping";
    }
}

let car;

beforeEach(()=>{
    car = new Car();
});

describe('Testing it statements',()=>{
    it('in it1 : testing drive',()=>{
        assert.equal(car.drive(),"driving")
    });
    it('in it2 : testing stop',()=>{
        assert.equal(car.stop(),'stopping');
    });
});
