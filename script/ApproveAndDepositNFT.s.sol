// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

import {Script, console} from "forge-std/Script.sol";
import {DevOpsTools} from "foundry-devops/src/DevOpsTools.sol";
import {NFTBridge} from "../src/NFTBridge.sol";
// import {FXRootABI} from "../abi/FXRootABI.js";

interface FXRootABI {
    function deposit(address _rootToken, address user, uint tokenId, bytes memory _data) external;
}

contract DepositNFT is Script {
    address public fxRootAddress = 0xF9bc4a80464E48369303196645e876c8C7D972de; // FxRoot contract address on Mumbai
     uint256[] public nfts = [0,1,2,3,4];
        NFTBridge nftBridge;

    function run() external {
        address mostRecentlyDeployed = DevOpsTools.get_most_recent_deployment(
            "NFTBridge",
            block.chainid
        );
        depositNftBridge(mostRecentlyDeployed);
    }

    function depositNftBridge(address contractAddress) public {
        vm.startBroadcast();
        nftBridge = new NFTBridge();
       nftBridge.mintNFT(
            0x1b6e16403b06a51C42Ba339E356a64fE67348e92,
            5
        );
        nftBridge.setApprovalForAll(fxRootAddress, true);

        for (uint256 index = 0; index < nfts.length; index++) {
            uint number = nfts[index];
        FXRootABI(fxRootAddress).deposit(
            address(nftBridge),
            address(0x1b6e16403b06a51C42Ba339E356a64fE67348e92),
            number,
            '0x'
        );  
        }        
        vm.stopBroadcast();
    }
}
