pragma solidity ^0.8.10;

contract stayHardToken{

    event Transfer(address indexed from, address indexed to, uint tokens);
    event Approval(address indexed tokenOwner, address indexed spender, uint tokens);
    string public constant NAME = "STAY HARD Token";
    string public constant SYMBOL = "HARD";
    uint public constant decimal = 18;

    //MAPPING {key: value}
    // address: 10000 HARD
    mapping(address => uint) balances;

    // {0x0: {0x1: 100 HARD}}
    mapping(address => mapping(address => uint)) allowedTransactions;

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
    function transfer(address to, uint amount) public returns (bool) {
        //Strictly say if we have enough tokens to send
        //Exits function if false
        require(amount <= balances[msg.sender], "insufficient funds");
        
        // remove the number of tokens from balances we are going to send
        balances[msg.sender] -= amount;
        balances[to] += amount;
        
        //Event fucntion is emitted, validated, and checked on blockchain
        //Verifies transaction
        emit Transfer(msg.sender, to, amount);
        return true;
    }
    function approve(address to, uint amount) public returns(bool){
        //populate allowed transactions
        allowedTransactions[msg.sender][to] = amount;
        emit Approval(msg.sender, to, amount);
        return true;
    }
    //view allowed transactions
    function allowance(address owner, address spender) public view returns(uint){
        return allowedTransactions[owner][spender];
    }
    function transfer(address from, address to, uint amount) public  returns (bool) {
        require(amount <= balances[from]);

        //Another check to know
        require(amount <= allowedTransactions[from][to], 'you are not allowed to send to account');
        balances[from] -= amount;
        //Send money from
        allowedTransactions[from][msg.sender] -= amount;
        balances[to] += amount;
        emit Transfer(from, to, amount);
        return true;
    }
}