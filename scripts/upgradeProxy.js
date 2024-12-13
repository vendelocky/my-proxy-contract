const { ethers, upgrades } = require('hardhat');

// TO DO: Place the address of your proxy here!
const proxyAddress = '';

async function main() {
  // Step by step, upgrade from V2 and then V3
  const VendingMachineV3 = await ethers.getContractFactory('VendingMachineV3');
  const upgraded = await upgrades.upgradeProxy(proxyAddress, VendingMachineV3);

  const implementationAddress = await upgrades.erc1967.getImplementationAddress(
    proxyAddress
  );

  // get the current owner address
  const owner = await upgraded.owner();

  console.log("The current contract owner is: " + owner);
  console.log('Implementation contract address: ' + implementationAddress);
}

main()
  .then(() => process.exit(0))
  .catch(error => {
    console.error(error);
    process.exit(1);
  });