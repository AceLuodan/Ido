
npm i 

npm install --save-dev hardhat @nomiclabs/hardhat-truffle5 ethers @nomiclabs/hardhat-web3 @nomiclabs/hardhat-etherscan @nomiclabs/hardhat-ethers @openzeppelin/hardhat-upgrades @nomiclabs/hardhat-ethers dotenv

npx hardhat run --network rinkeby  deploy/deployWhiteList.js

npx hardhat run --network rinkeby  deploy/deployPublicSale.js


npx hardhat run --network okextest  deploy/deployPublicSale_okex.js


npx hardhat run --network okextest  deploy/deployWhiteList_okex.js


omcMain

npx hardhat run --network okexmain  deploy/deployPublicSale_okexmain.js


npx hardhat run --network okexmain  deploy/deployWhiteList_okexmain.js




 if(totalUnderlying.mul(price) < totalCurrency.mul(1e18))

 合约内U价值 > Token 价值（0.1U * token数量）