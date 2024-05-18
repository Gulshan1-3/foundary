// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.19;

contract Wallet{
    address payable public owner;

    constructor() payable {
        owner = payable(msg.sender);
    }

    receive() external payable{}

    function withdraw(uint amount)external{
        require(msg.sender==owner,"caller is not owner");
        payable(msg.sender).transfer(amount);

    }

    function setOwner(address _owner) external{
        require(msg.sender==owner,"caller is not owner");
        owner = payable(_owner);
    }

    function testSendEth() public {
        deal(address(1), 100);

        assert(address(1).balance,100);
    }
}