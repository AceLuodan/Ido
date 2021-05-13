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

  // price * 1e18  * 10**cur / 10 ** token
  let  price = ethers.BigNumber.from("100000000000000000").mul(ethers.BigNumber.from("1000000") ).div(ethers.BigNumber.from("1000000000000000000") );
  console.log("price : ",price.toString());
  //address governor_,address currency_, address token_, uint ratio_, address payable recipient_, address payable feeOwner_,uint feeRatio_,uint timeOffer_, uint timeClaim_,uint minUsdtTotalOffered_,uint minUsdtPersonOffered_
  const offering = await WhiteList.deploy("0x66d59cA5721Ce058B706581d983bbD7c5bA366f1","0xe579156f9decc4134b5e3a30a24ac46bb8b01281",
  "0xc5e96b3bcb700584ce108f30f118d406f3938403",price ,"0x66d59cA5721Ce058B706581d983bbD7c5bA366f1","0x66d59cA5721Ce058B706581d983bbD7c5bA366f1",ethers.BigNumber.from("30000000000000000"),"1618827957","1618827657000","10000000",100000
  );

  console.log("offering Contract Address:", offering.address);
}

main()
  .then(() =>  process.exit(0))
  .catch(error => {
    console.error(error);
    process.exit(1);
  });

