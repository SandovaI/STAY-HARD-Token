pragma solidity ^0.8.10;

import 'https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC20/ERC20.sol';

contract stayHardToken is ERC20{


    constructor() ERC20('STAY HARD Token', 'HARD'){

        _mint(msg.sender, 1000 * 10 ** 18);
        
    }
   


}