const { ethers, upgrades } = require("hardhat");

async function main() {

  const [deployer] = await ethers.getSigners();

  console.log(
    "Deploying contracts with the account:",
    deployer.address
  );

  //console.log("Account balance:", (await deployer.getBalance()).toString());

  const PublicSale = await ethers.getContractFactory("PublicSale");
// price * 1e18  * 10**curDec / 10 ** tokenDec   18 - 18
  let  price = ethers.BigNumber.from("100000000000000000");//0.1 USDT = 1T
  console.log("price : ",price.toString());

  //(address governor_, address currency_, address underlying_, uint price_, uint timeOffer_, uint timeClaim_, address payable recipient_, address payable feeOwner_,uint feeRatio_,uint minUsdtTotalOffered_,uint maxUsdtTotalOffered_,uint minUsdtPersonOffered_,uint maxUsdtPersonOffered_) 
  const publicSale = await PublicSale.deploy("0xCD132161A87C2aB9A6E392ef3bD582c924efC67E","0x382bb369d343125bfb2117af9c149795c6c65c50",
  "0xd543f968212ef07Aa6916CC645f98345852fFa3D",price,"1618827957","1618827657000", "0xCD132161A87C2aB9A6E392ef3bD582c924efC67E","0xCD132161A87C2aB9A6E392ef3bD582c924efC67E",ethers.BigNumber.from("30000000000000000"),10000000,ethers.BigNumber.from("50000000000000000000000000") ,100000,ethers.BigNumber.from("500000000000000000000") 
  );

  console.log("PublicSale Contract Address:", publicSale.address);
}

main()
  .then(() =>  process.exit(0))
  .catch(error => {
    console.error(error);
    process.exit(1);
  });

