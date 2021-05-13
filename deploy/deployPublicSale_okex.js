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
  const publicSale = await PublicSale.deploy("0x66d59cA5721Ce058B706581d983bbD7c5bA366f1","0xe579156f9decc4134b5e3a30a24ac46bb8b01281",
  "0xc5e96b3bcb700584ce108f30f118d406f3938403",price,"1618827957","1618827657000", "0x66d59cA5721Ce058B706581d983bbD7c5bA366f1","0x66d59cA5721Ce058B706581d983bbD7c5bA366f1",ethers.BigNumber.from("30000000000000000"),10000000,ethers.BigNumber.from("50000000000000000000000000") ,100000,1000000000
  );

  console.log("PublicSale Contract Address:", publicSale.address);
}

main()
  .then(() =>  process.exit(0))
  .catch(error => {
    console.error(error);
    process.exit(1);
  });

