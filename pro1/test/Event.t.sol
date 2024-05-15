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

   emit Transfer(address(this), address(345), 456);

   e.transfer(address(this), address(345), 456);
  }

  function testEmitManyTransferEvent() public{
   address [] memory to = new address[](2);
   to[0] = address(123);
   to[1] = address(456);

   uint256 [] memory amounts = new uint256[](2);

   amounts[0] = 777;
   amounts[1] = 888;

    for (uint256 i = 0; i< to.length;i++) {
         vm.expectEmit(true,true,false,true);

   emit Transfer(address(this), to[i], amounts[i]);

      }

      e.transferMany(address(this), to, amounts);

  }
}