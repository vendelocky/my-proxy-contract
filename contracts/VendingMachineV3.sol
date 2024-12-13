// SPDX-License-Identifier: MIT
pragma solidity 0.8.24;

import "@openzeppelin/contracts-upgradeable/proxy/utils/Initializable.sol";

contract VendingMachineV3 is Initializable {
  // these state variables and their values
  // will be preserved forever, regardless of upgrading
  uint public numSodas;
  address public owner;
  mapping(address => uint) public numSodasPurchased;

  function initialize(uint _numSodas) public initializer {
    numSodas = _numSodas;
    owner = msg.sender;
  }

  function purchaseSoda() public payable {
    require(numSodas > 0, "We are running out of sodas!");
    require(msg.value >= 1000 wei, "You must pay 1000 wei for a soda!");
    numSodas--;
    // challenge: add a mapping to keep track of user soda purchases!
    numSodasPurchased[msg.sender]++;
  }

  function withdrawProfits() public onlyOwner {
    require(address(this).balance > 0, "Profits must be greater than 0 in order to withdraw!");
    (bool sent, ) = owner.call{value: address(this).balance}("");
    require(sent, "Failed to send ether");
  }

  function setNewOwner(address _newOwner) public onlyOwner {
    owner = _newOwner;
  }

  function addNewSodas(uint newSodas) public onlyOwner {
    numSodas += newSodas;
  }

  modifier onlyOwner() {
    require(msg.sender == owner, "Only owner can call this function.");
    _;
  }
}