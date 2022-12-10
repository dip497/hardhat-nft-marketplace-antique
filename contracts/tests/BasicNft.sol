// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";

//  "ipfs/QmRX98o9UC8CR4xmpzcDf64Bnqi2Sr7mLSAkqyL64rLfW9?filename=WIN_20220912_12_25_40_Pro.jpg";
contract BasicNft is ERC721 {
    string public constant TOKEN_URI =
        "ipfs/QmZthJbbryq4Dn9QEZRGYPoMcxbg113z4J8G4CFLGNvCFn?filename=icons8-car-32.png";
    uint256 private s_tokenCounter;

    event DogMinted(uint256 indexed tokenId);

    constructor() ERC721("Antique", "ANQ") {
        s_tokenCounter = 0;
    }

    function mintNft() public {
        _safeMint(msg.sender, s_tokenCounter);
        emit DogMinted(s_tokenCounter);
        s_tokenCounter = s_tokenCounter + 1;
    }

    function tokenURI(
        uint256 tokenId
    ) public view override returns (string memory) {
        require(
            _exists(tokenId),
            "ERC721Metadata: URI query for nonexistent token"
        );
        return TOKEN_URI;
    }

    function getTokenCounter() public view returns (uint256) {
        return s_tokenCounter;
    }
}
