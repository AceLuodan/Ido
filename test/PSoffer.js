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
  
   const gasFund = _ = ethers.utils.parseUnits("0.002", 18);
      
   const tx =await publicSale.offer(0, {
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