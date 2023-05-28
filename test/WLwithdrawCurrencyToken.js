const { ethers, upgrades } = require("hardhat");


async function main() {

    const [deployer] = await ethers.getSigners();
  
    console.log(
      "Deploying contracts with the account:",
      deployer.address
    );
  
    //console.log("Account balance:", (await deployer.getBalance()).toString());
  
    const WhiteList = await ethers.getContractFactory("WhiteList");

  const whiteList = await WhiteList.attach("0x48B65bE9B893B2372bF2d9d41f849CF8FDf2239D");
  
  console.log(await whiteList.timeClaim())
  
  // console.log("claimable:"+await publicSale.claimable(deployer.address))
  // console.log("totalClaimable:"+ await publicSale.totalClaimable( ))

  // console.log("settleRate:"+await publicSale.settleRate())
  // console.log("price:" + await publicSale.price())
  
  // console.log("withdrawable:"+await publicSale.withdrawable())
  console.log(await whiteList.withdrawCurrencyToken());

  }
  
  main()
    .then(() =>  process.exit(0))
    .catch(error => {
      console.error(error);
      process.exit(1);
    });