// SPDX-License-Identifier: UNLICENSED
pragma solidity >=0.4.22 <0.9.0;

import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/utils/Counters.sol";

contract testnft is ERC721URIStorage {
    using Counters for Counters.Counter;
    Counters.Counter private _tokenIds;
    string private TOKENuri_;

    event Newtestnft(address sender, uint256 tokenId, string tokenURI);

    //Deply EPC721 with name and description specified.
    constructor() ERC721("ETH on Harmony using NFT.Storage", "HNFT-L") {}

    //mint a new NFT Item and update its tokenURI with IPFS link.
    function mintItem(string memory token_URI) public {
        _tokenIds.increment();

        uint256 newItemId = _tokenIds.current();
        _mint(msg.sender, newItemId);
        _setTokenURI(newItemId, token_URI);
        TOKENuri_ = token_URI;
        emit Newtestnft(msg.sender, newItemId, token_URI);
    }

    function tokenURI(
        uint256 tokenId
    ) public view override returns (string memory) {
        require(
            _exists(tokenId),
            "ERC721Metadata: URI query for nonexistent token"
        );
        return TOKENuri_;
    }
}
