const { ethers, upgrades } = require("hardhat");
var utils = require('ethers').utils;
async function main() {

  const [deployer] = await ethers.getSigners();

  console.log(
    "Deploying contracts with the account:",
    deployer.address
  );

  //console.log("Account balance:", (await deployer.getBalance()).toString());

  const WhiteList = await ethers.getContractFactory("WhiteList");

  // price * 1e18  * 10**cur / 10 ** token  0.1 USDT = 1T
  let  price = ethers.BigNumber.from("100000000000000000");
  console.log("price : ",price.toString());
  //address governor_,address currency_, address token_, uint ratio_, address payable recipient_, address payable feeOwner_,uint feeRatio_,uint timeOffer_, uint timeClaim_,uint minUsdtTotalOffered_,uint minUsdtPersonOffered_
  const offering = await WhiteList.deploy("0xCD132161A87C2aB9A6E392ef3bD582c924efC67E","0x382bb369d343125bfb2117af9c149795c6c65c50",
  "0xd543f968212ef07Aa6916CC645f98345852fFa3D",price ,"0xCD132161A87C2aB9A6E392ef3bD582c924efC67E","0xCD132161A87C2aB9A6E392ef3bD582c924efC67E",ethers.BigNumber.from("30000000000000000"),"1618827957","1618827657000",ethers.BigNumber.from("1000000000000000000"),ethers.BigNumber.from("100000000000000000")
  );

  

  console.log("offering Contract Address:", offering.address);
}

main()
  .then(() =>  process.exit(0))
  .catch(error => {
    console.error(error);
    process.exit(1);
  });

