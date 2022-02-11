pragma solidity ^0.8.10;

contract numbers{
    uint[] nums = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20];
    uint[] public evens;
    uint[] public odds;

    function populateEvenArray() public returns (uint[] memory) {
         for(uint i = 0; i < nums.length; i++){
             if(nums[i] % 2 == 0){
                 evens.push(nums[i]);
             }
         }
         return evens;
     }

     function populateOddArray() public returns (uint[] memory) {
         for(uint i = 0; i < nums.length; i++){
             if(nums[i] % 2 == 1){
                 odds.push(nums[i]);
             }
         }
         return odds;
     }
}