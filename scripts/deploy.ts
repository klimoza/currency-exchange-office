import { deploy } from './ethers-lib'

(async () => {
    try {
        const coinResult = await deploy('JBCoin', [100])
        console.log(`JBCoin address: ${coinResult.address}`)
        const result = await deploy('CurrencyExchangeOffice', [])
        console.log(`CurrencyExchangeOffice address: ${result.address}`)
    } catch (e) {
        console.log(e.message)
    }
  })()