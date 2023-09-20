
import { ethers } from "hardhat";

const name = "token";
const symbol = "token";
const baseTokenURI = "token_uri";

async function main() {

  const deploy_contract = await ethers.deployContract("NFTTemplate", [name, symbol, baseTokenURI]);

  await deploy_contract.waitForDeployment();

  console.log("NFTTemplate is deployed to : ",await deploy_contract.getAddress());
}

// We recommend this pattern to be able to use async/await everywhere
// and properly handle errors.
main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
