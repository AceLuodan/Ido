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
  
   const gasFund = _ = ethers.utils.parseUnits("0.001", 18);
   console.log("Quotas:" + await whiteList.quotaUsdtOf(deployer.address));
   const tx =await whiteList.offer(0, {
      value: gasFund,
    })

  console.log(tx);

  }
  
  main()
    .then(() =>  process.exit(0))
    .catch(error => {
      console.error(error);
      process.exit(1);
    });