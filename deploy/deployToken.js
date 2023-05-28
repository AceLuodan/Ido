const { ethers, upgrades } = require("hardhat");

async function main() {

  const [deployer] = await ethers.getSigners();

  console.log(
    "Deploying contracts with the account:",
    deployer.address
  );
  const TokenContract = await ethers.getContractFactory("TokenContract");
  const total = ethers.utils.parseUnits("9000000", 18);
  const tokenContract = await TokenContract.deploy(total,"T","T",18);
  console.log("TokenContract Contract Address:", tokenContract.address);
}

main()
  .then(() =>  process.exit(0))
  .catch(error => {
    console.error(error);
    process.exit(1);
  });

