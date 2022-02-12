pragma solidity ^0.8.10;

import 'https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC20/ERC20.sol';

contract StayHardToken is ERC20{

    mapping(address => uint256) private _balances;

    mapping(address => mapping(address => uint256)) private _allowances;

    uint256 private _totalSupply;

    string private _name;
    string private _symbol;

    constructor() ERC20('STAY HARD Token', 'HARD'){

        _mint(msg.sender, 100 * 10 ** 18 );                                      
    }
   


}