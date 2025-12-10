//// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "./Bricks.sol";
import "./Soap.sol";
import "./ERC20.sol";

contract BarterExchange  {
    Bricks private briksToken;
    Soap  private soapToken;
    uint256 public rate = 10;

    constructor(address _brickTokenAddress, address _soapTokenAddress) {
        briksToken = Bricks(_brickTokenAddress);
        soapToken = Soap(_soapTokenAddress);

    }
    function exchangeBricksForSoap(uint256 brickAmount) public {
     require(brickAmount % rate == 0, "Eror");
      uint256 soapAmount = brickAmount / rate;
      briksToken.transferFrom(msg.sender, address(this), brickAmount);
       soapToken.transfer(msg.sender, soapAmount);
    }



}
