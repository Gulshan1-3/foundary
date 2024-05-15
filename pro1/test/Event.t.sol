// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.19;

import "forge-std/Test.sol"; 

import {Event} from "../src/Event.sol";

contract EventTest is Test{
  Event public e;

  event Transfer(address from,address to,uint256 amount);

  function setUp() public{
    e = new Event();
  }
  function testEmitTransferEvent() public{
   vm.expectEmit(true,true,false,true);

   emit Transfer(address(this), address(123), 456);

   e.transfer(address(this), address(123), 456);
  }

  function testEmitManyTransferEvent() public{

  }
}