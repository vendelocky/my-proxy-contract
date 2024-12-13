# ALCHEMY UNIVERSITY ASSIGNMENT - WEEK 7A
Disclaimer: A portion of the codes are not written by me, as it is already provided from Alchemy University. But the assignment is to be completed in our version, and here is my version on this week assignment :)

## Upgrading Contract using proxy

In this project, we will run through deploying smart contracts that use the transparent proxy pattern in order to be upgradeable. Deploying contracts under a proxy can be useful in order to future-proof smart contract functionality.

In this setup, we are working on a upgradeable vending machine smart contract.

### Setup
1. In a folder of your choice, create a new folder
2. Run `npm init -y`
3. Run `npm install --save-dev hardhat`
4. Run `npm install @nomicfoundation/hardhat-toolbox @openzeppelin/contracts-upgradeable @openzeppelin/hardhat-upgrades`
5. We will be verifying our contract on Etherscan! Run `npm install @nomiclabs/hardhat-etherscan@3.0.1`
6. We will be using dotenv to keep our project-wide environment variables safe and accessible! Run `npm install dotenv`
7. Run `npx hardhat` to initiate the Hardhat development environment. This will bring up some yes/no options, press Enter to select 'Create a JavaScript project'

Next, follow the instructions on the Assignment on Week 7 about _Deploy Upgradeable Smart Contracts_