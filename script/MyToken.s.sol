// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Script, console} from "forge-std/Script.sol";
import {MyToken} from "../src/MyToken.sol";

contract MyTokenScript is Script {
    MyToken public token;

    function setUp() public {}

    function run() public {
        vm.startBroadcast();

        // Token parameters
        string memory name = "MyToken";
        string memory symbol = "MTK";
        uint8 decimals = 18;
        uint256 initialSupply = 1000000; // 1 million tokens

        token = new MyToken(name, symbol, decimals, initialSupply * 10 ** decimals);

        console.log("MyToken deployed at:", address(token));
        console.log("Token name:", token.name());
        console.log("Token symbol:", token.symbol());
        console.log("Token decimals:", token.decimals());
        console.log("Initial supply:", token.totalSupply());


        vm.stopBroadcast();
    }
}
