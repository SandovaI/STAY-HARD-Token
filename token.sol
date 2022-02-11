pragma solidity ^0.8.10;

contract stayHardToken{
    string public constant NAME = "STAY HARD Token";
    string public constant SYMBOL = "HARD";
    uint public constant decimal = 18;

    //MAPPING {key: value}
    // address: 10000 HARD
    mapping(address => uint) balances;

    // Supply
    uint _totalSupply;

    constructor(uint inputValue){
        _totalSupply = inputValue;
        //msg.sender => your metamask
        balances[msg.sender] = _totalSupply;
    }
    //1st ERC-20 standard function
    function totalSupply() public view returns(uint){
        return _totalSupply;
    }

    function balanceOf(address owner) public view returns(uint){
        return balances[owner];
    }
}