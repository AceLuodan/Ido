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
  const e = ethers.utils.parseEther('1');
  console.log(e);
 
  //console.log("Account balance:", (await deployer.getBalance()).toString());
  const curDec = ethers.utils.parseUnits("1", 18);
  const tokenDec = ethers.utils.parseUnits("1", 18);
// price * 1e18  * 10**curDec / 10 ** tokenDec
  //1个token（decimal =6） 等于0.0001 个ETH
  // let  price = ethers.BigNumber.from("100000000000000000").mul(ethers.BigNumber.from("1000000") ).div(ethers.BigNumber.from("1000000000000000000") );
  let  price = e.mul(curDec ).div(tokenDec).div(10);
  
  console.log("price : ", price.toString());
  const feeRatio_ = ethers.utils.parseUnits("0.03", 18);
  const minUsdtTotalOffered_ =1;
  const maxUsdtTotalOffered_ = ethers.utils.parseUnits("1000000", 18);
  const minUsdtPersonOffered_ = ethers.utils.parseUnits("0.0001", 18);
  const maxUsdtPersonOffered_ = ethers.utils.parseUnits("1000", 18);
  console.log("feeRatio_ : ", feeRatio_.toString());
  console.log("maxUsdtTotalOffered_ : ", maxUsdtTotalOffered_.toString());
  console.log("minUsdtPersonOffered_ : ", minUsdtPersonOffered_.toString());
  console.log("maxUsdtPersonOffered_ : ", maxUsdtPersonOffered_.toString());
  const governor_ = "0x9486C6F40cb91AA0880e22C707a6689A8Ec7688c";
  const currency_ = "0x0000000000000000000000000000000000000000";
  const underlying_ = "0x671467E6E211be745D8FF41A5bC9740b4293892a";
  const timeOffer_ = "1618827957";
  const timeClaim_ = "1618827657000";
  const recipient_ = "0x9486C6F40cb91AA0880e22C707a6689A8Ec7688c";
  const feeOwner_ = "0x94096ad1A59b2175618fc5705b2038747E7D76E6";

  // price * 1e18  * 10**cur / 10 ** token
  // let  price = ethers.BigNumber.from("100000000000000000").mul(ethers.BigNumber.from("1000000") ).div(ethers.BigNumber.from("1000000000000000000") );
  console.log("price : ",price.toString());
  // address governor_,
  // address currency_,
  // address token_,
  // uint price_,
  // address payable recipient_,
  // address payable feeOwner_,
  // uint feeRatio_,
  // uint timeOffer_,
  // uint timeClaim_,
  // uint minUsdtTotalOffered_,
  // uint minUsdtPersonOffered_
  // const offering = await WhiteList.deploy("0x66d59cA5721Ce058B706581d983bbD7c5bA366f1","0x6d88d6d36B6B9F2FA216c0dB268bc6f93C6E829e",
  // "0x3cbcb0593b0deb9879350a338b9530781701a992",price ,"0x66d59cA5721Ce058B706581d983bbD7c5bA366f1","0x66d59cA5721Ce058B706581d983bbD7c5bA366f1",ethers.BigNumber.from("30000000000000000"),"1618827957","1618827657000","10000000",100000
  // );

  const offering = await WhiteList.deploy(governor_,currency_,
    underlying_, price, recipient_, feeOwner_, feeRatio_,
    timeOffer_, timeClaim_,
     minUsdtTotalOffered_,
     minUsdtPersonOffered_
);

  console.log("WhiteList Contract Address:", offering.address);
}

main()
  .then(() =>  process.exit(0))
  .catch(error => {
    console.error(error);
    process.exit(1);
  });

