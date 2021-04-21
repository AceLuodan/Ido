const { ethers, upgrades } = require("hardhat");

async function main() {

  const [deployer] = await ethers.getSigners();

  console.log(
    "Deploying contracts with the account:",
    deployer.address
  );

  //console.log("Account balance:", (await deployer.getBalance()).toString());

  const Offering = await ethers.getContractFactory("Offering");
  const offering = await Offering.deploy("0x66d59cA5721Ce058B706581d983bbD7c5bA366f1","0x6d88d6d36B6B9F2FA216c0dB268bc6f93C6E829e",
  "0x3cbcb0593b0deb9879350a338b9530781701a992",ethers.BigNumber.from("10000000000000000000") ,"0x66d59cA5721Ce058B706581d983bbD7c5bA366f1","1618827957","1618827657000"
  );

  console.log("offering Contract Address:", offering.address);
}

main()
  .then(() =>  process.exit(0))
  .catch(error => {
    console.error(error);
    process.exit(1);
  });

