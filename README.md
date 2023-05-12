# Currency Exchange Office
Implementation currency exchange office smart contract in Solidity, powered by Ethereum blockchain. The conctract allows you to exchange ERC20 tokens.

## Project Structure
- File `contracts/CurrencyExchangeOffice.sol` contains the smart contract with currencies exchange functionality.
- File `contracts/JBCoin.sol` contains custom ERC20 token implementation.
- File `scripts/deploy.ts` contains deployment script.
- File `scripts/ethers-lib.ts` contains helper functions for deployment script.

## Deployment
1. Upload all the files to Remix IDE and compile them.
2. Run `scripts/deploy.ts` to deploy the contracts. After deployment, you will have 100 `JBCoin` tokens availible for you.
3. To transfer `JBCoin` to the `CurrencyExchangeOffice` contract you need:
  - Call `approve` method of `JBCoin` contract with `CurrencyExchangeOffice` contract address as a first parameter and amount of tokens you want to transfer as a second parameter.
  - Call `addInternalCurrency` method of `CurrencyExchangeOffice` contract with `JBCoin` contract address as a first parameter and amount of tokens you want to transfer as a second parameter.