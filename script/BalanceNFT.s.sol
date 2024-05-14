// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

import {Script, console} from "forge-std/Script.sol";
import {DevOpsTools} from "foundry-devops/src/DevOpsTools.sol";

  interface NFTBridge {
    function balanceOf(address _owner) external returns(uint);
}

contract NFTBalance is Script {
    function run() external {
        vm.startBroadcast();
        uint number = NFTBridge(0x4E20bBdeE432DF7b3D69eab053FbAFbe61215048).balanceOf(0xf39Fd6e51aad88F6F4ce6aB8827279cffFb92266);
        vm.stopBroadcast();
    }
}
