// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

import {Script, console} from "forge-std/Script.sol";
import {DevOpsTools} from "foundry-devops/src/DevOpsTools.sol";
import {NFTBridge} from "../src/NFTBridge.sol";

contract MintBatchNFT is Script {
    function run() external {
        address mostRecentlyDeployed = DevOpsTools.get_most_recent_deployment(
            "NFTBridge",
            block.chainid
        );
        mintNftOnContract(mostRecentlyDeployed);
    }

    function mintNftOnContract(address contractAddress) public {
        vm.startBroadcast();
        NFTBridge(contractAddress).mintNFT(
            0x1b6e16403b06a51C42Ba339E356a64fE67348e92,
            5
        );
        vm.stopBroadcast();
    }
}
