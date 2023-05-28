const { ethers, upgrades } = require("hardhat");

async function main() {

  const [deployer] = await ethers.getSigners();

  console.log(
    "Deploying contracts with the account:",
    deployer.address
  );
  const e = ethers.utils.parseEther('1');
  console.log(e);
 
  //console.log("Account balance:", (await deployer.getBalance()).toString());
  const curDec = ethers.utils.parseUnits("1", 18);
  const tokenDec = ethers.utils.parseUnits("1", 18);
  const PublicSale = await ethers.getContractFactory("PublicSale");
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
 
    const publicSale = await PublicSale.deploy(governor_,currency_,
      underlying_, price, timeOffer_, timeClaim_,
      recipient_, feeOwner_,
      feeRatio_, minUsdtTotalOffered_,maxUsdtTotalOffered_,
    1, maxUsdtPersonOffered_
  );
  console.log("PublicSale Contract Address:", publicSale.address);
}

main()
  .then(() =>  process.exit(0))
  .catch(error => {
    console.error(error);
    process.exit(1);
  });

