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

  //setQuotas(
//     address[] calldata addrs,
//     uint[] calldata amounts
// )
  
  console.log(await whiteList.timeClaim())
  const amount = ethers.utils.parseUnits("0.002", 18);
  const amount1 = ethers.utils.parseUnits("0.001", 18);
  const addrs = new Array("0x94096ad1A59b2175618fc5705b2038747E7D76E6","0x707cc7727Ca057056516b48864F0BA52B8A03A2b","0x9b3588e1Ba7bd16FBc5C8456F0D7CC23115fF13d");
  const amounts = new Array (amount,amount1,amount1);
  // console.log(await whiteList.setQuotas(addrs,amounts));
  console.log(await whiteList["setQuotas(address[],uint256[])"](addrs,amounts));
  }
  
  main()
    .then(() =>  process.exit(0))
    .catch(error => {
      console.error(error);
      process.exit(1);
    });