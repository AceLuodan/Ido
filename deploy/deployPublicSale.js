const { ethers, upgrades } = require("hardhat");

async function main() {

  const [deployer] = await ethers.getSigners();

  console.log(
    "Deploying contracts with the account:",
    deployer.address
  );

  //console.log("Account balance:", (await deployer.getBalance()).toString());

  const PublicSale = await ethers.getContractFactory("PublicSale");
// price * 1e18  * 10**curDec / 10 ** tokenDec
  let  price = ethers.BigNumber.from("100000000000000000").mul(ethers.BigNumber.from("1000000") ).div(ethers.BigNumber.from("1000000000000000000") );
  console.log("price : ",price.toString());

  //(address governor_, address currency_, address underlying_, uint price_, uint timeOffer_, uint timeClaim_, address payable recipient_, address payable feeOwner_,uint feeRatio_,uint minUsdtTotalOffered_,uint maxUsdtTotalOffered_,uint minUsdtPersonOffered_,uint maxUsdtPersonOffered_) 
  const publicSale = await PublicSale.deploy("0x66d59cA5721Ce058B706581d983bbD7c5bA366f1","0x6d88d6d36B6B9F2FA216c0dB268bc6f93C6E829e",
  "0x3cbcb0593b0deb9879350a338b9530781701a992",price,"1618827957","1618827657000", "0x66d59cA5721Ce058B706581d983bbD7c5bA366f1","0x66d59cA5721Ce058B706581d983bbD7c5bA366f1",ethers.BigNumber.from("30000000000000000"),10000000,ethers.BigNumber.from("50000000000000000000000000") ,100000,1000000000
  );

  console.log("PublicSale Contract Address:", publicSale.address);
}

main()
  .then(() =>  process.exit(0))
  .catch(error => {
    console.error(error);
    process.exit(1);
  });

