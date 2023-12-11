// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;

// create create a contract using key word contract
contract tokenTransfer {
    uint256 public withDrawlDate ;
    address payable public owner;
    event withDrawl (uint256 amount , uint256 when );
    constructor(uint256 _withDrawlDate)  {
        require(block.timestamp < _withDrawlDate, "With Drawl date must be in future");
        withDrawlDate = _withDrawlDate;
        owner = payable(msg.sender);
    }
function withDraw() payable public{
    require (block.timestamp < withDrawlDate, "You can not with draw it now");
    require(msg.sender == owner,"Only owner can with draw");
    emit withDrawl(address(this).balance , block.timestamp);
    owner.transfer(address(this).balance);
}

}
