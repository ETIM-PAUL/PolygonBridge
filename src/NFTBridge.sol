// SPDX-License-Identifier: UNLICENSED
pragma solidity >=0.8.0;

import "../lib/ERC721A/contracts/ERC721A.sol";

contract NFTBridge is ERC721A {
    uint tokenId;
    constructor() ERC721A("W3B", "Web3 Generated NFT") {}

    function mintNFT(address _to, uint256 _quantity) public {
        tokenId + _quantity;
        _mint(_to, _quantity);
    }

    function getPromptDescription()
        public
        pure
        returns (string memory _promptDescription)
    {
        _promptDescription = "a baby that knows how to bridge NFT between chains";
    }

    function _baseURI() internal pure override returns (string memory) {
        return
            "https://gateway.pinata.cloud/ipfs/QmTWHeaMwpJPsjgws6CunDk4FtHPpUzZMfaPfpB4kyc2Ms/";
    }
}
