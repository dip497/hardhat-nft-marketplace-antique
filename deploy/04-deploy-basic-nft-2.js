const { network } = require("hardhat");
const {
  developmentChains,
  VERIFICATION_BLOCK_CONFIRMATIONS,
} = require("../helper-hardhat-config");
const { verify } = require("../utils/verify");

module.exports = async ({ getNamedAccounts, deployments }) => {
  const { deploy, log } = deployments;
  const { deployer } = await getNamedAccounts();
  const waitBlockConfirmations = developmentChains.includes(network.name)
    ? 1
    : VERIFICATION_BLOCK_CONFIRMATIONS;

  log("----------------------------------------------------");
  const arguments = [
    (temptokenURI =
      "ipfs/QmRX98o9UC8CR4xmpzcDf64Bnqi2Sr7mLSAkqyL64rLfW9?filename=WIN_20220912_12_25_40_Pro.jpg"),
  ];
  const BasicNft = await deploy("BasicNftTwo", {
    from: deployer,
    args: arguments,
    log: true,
    waitConfirmations: waitBlockConfirmations,
  });

  // Verify the deployment
  if (
    !developmentChains.includes(network.name) &&
    process.env.ETHERSCAN_API_KEY
  ) {
    log("Verifying...");
    await verify(BasicNft.address, arguments);
  }
  log("----------------------------------------------------");
};

module.exports.tags = ["all", "BasicNft"];
