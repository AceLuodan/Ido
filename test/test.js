const { ethers, upgrades } = require("hardhat");


async function main() {

    const [deployer] = await ethers.getSigners();
  
    console.log(
      "Deploying contracts with the account:",
      deployer.address
    );
  
    //console.log("Account balance:", (await deployer.getBalance()).toString());
  
    const CatDAOContract = await ethers.getContractFactory("CatDAOContract");

    const box = await CatDAOContract.attach("0x86C89632642F655e745984E7fFD4953ECE03352f");


    (await box.version()).toString()

  }
  
  main()
    .then(() =>  process.exit(0))
    .catch(error => {
      console.error(error);
      process.exit(1);
    });