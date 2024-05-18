// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.19;

import "forge-std/Test.sol";

import {Wallet} from "../src/wallet.sol";

contract AuthTest is Test {
  Wallet public wallet;

  function setUp() public {
    wallet = new Wallet{value: 1e18}();
  }
 
 //deal:set balance of address
 //hoax: set prank and balance of address,deal+prank
   function _send(uint256 amount) private {
    (bool ok,) = address(wallet).call{value:amount}("");

    require(ok,"send eth failed");
   }


   function testEthBalance() public view{
      console.log("EthBalance",address(this).balance/1e18);
   }
}