const HDWalletProvider = require('truffle-hdwallet-provider');
const Web3 = require('web3');
const {interface,bytecode} = require('./compile');



const provider = new HDWalletProvider(
    "",
    "https://rinkeby.infura.io/v3/825bec5e1bb04fef97aeb74201a9e6d3"
);

const web3 = new Web3(provider);

const deploy = async() => {

    const accounts = await web3.eth.getAccounts();

    const result = await new web3.eth.Contract(JSON.parse(interface))
                        .deploy({data : bytecode, arguments : ["HEY THERE!"] })
                        .send({ gas: '1000000', gasPrice: '5000000000', from: accounts[0] });

    console.log(result.options.address);

};
deploy();