const { ethers, network } = require("hardhat");

const PRICE = ethers.utils.parseEther("0.01");

async function mint() {
  const basicNft = await ethers.getContract("BasicNft");
  console.log("Minting NFT...");
  const mintTx = await basicNft.mintNft();
  const mintTxReceipt = await mintTx.wait(1);
  console.log(
    `Minted tokenId ${mintTxReceipt.events[0].args.tokenId.toString()} from contract: ${
      basicNft.address
    }`
  );
}

mint()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1);
  });
