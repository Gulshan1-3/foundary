// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.19;

import "forge-std/Test.sol";

import {Wallet} from "../src/wallet.sol";

contract AuthTest is Test {
  Wallet public wallet;

  function setUp() public {
    wallet = new Wallet();
  }

   function testSetOwner() public {
    wallet.setOwner(address(1));
    assertEq(wallet.owner(),address(1));
   }

   function testFailNotOwner() public{
    vm.prank(address(1));
    wallet.setOwner(address(1));
   }
}