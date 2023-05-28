const { ethers, upgrades } = require("hardhat");


async function main() {

    const [deployer] = await ethers.getSigners();
  
    console.log(
      "Deploying contracts with the account:",
      deployer.address
    );
  
    //console.log("Account balance:", (await deployer.getBalance()).toString());
  
    const PublicSale = await ethers.getContractFactory("PublicSale");

  const publicSale = await PublicSale.attach("0x893910d7a0Af354D0aa368Ff777b155dDCAd7755");
  
  console.log(await publicSale.timeClaim())
  
  console.log("claimable:"+await publicSale.claimable(deployer.address))
  console.log("totalClaimable:"+ await publicSale.totalClaimable( ))

  console.log("settleRate:"+await publicSale.settleRate())
  console.log("price:" + await publicSale.price())
  
  console.log("withdrawable:"+await publicSale.withdrawable())
  console.log(await publicSale.setTimeClaim(1685178359));

  }
  
  main()
    .then(() =>  process.exit(0))
    .catch(error => {
      console.error(error);
      process.exit(1);
    });