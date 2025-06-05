// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test, console} from "forge-std/Test.sol";
import {MyToken} from "../src/MyToken.sol";

contract MyTokenTest is Test {
    MyToken public token;
    address public user1;
    address public user2;

    uint256 constant INITIAL_SUPPLY = 1000000; // 1 million tokens
    uint8 constant DECIMALS = 18;
    string constant NAME = "MyToken";
    string constant SYMBOL = "MTK";
    address public owner;

    function setUp() public {
        owner = address(this);
        user1 = address(0x1);
        user2 = address(0x2);
        
        token = new MyToken(NAME, SYMBOL, DECIMALS, INITIAL_SUPPLY * 10**DECIMALS);
    }

    function test_InitialState() public {
        assertEq(token.name(), NAME);
        assertEq(token.symbol(), SYMBOL);
        assertEq(token.decimals(), DECIMALS);
        assertEq(token.totalSupply(), INITIAL_SUPPLY * 10**DECIMALS);
        assertEq(token.balanceOf(owner), INITIAL_SUPPLY * 10**DECIMALS);

    }

    function test_Transfer() public {
        uint256 amount = 100 * 10**DECIMALS;
        token.transfer(user1, amount);
        
        assertEq(token.balanceOf(user1), amount);
        assertEq(token.balanceOf(owner), (INITIAL_SUPPLY * 10**DECIMALS) - amount);
    }

    function test_Approve() public {
        uint256 amount = 50 * 10**DECIMALS;
        token.approve(user1, amount);
        
        assertEq(token.allowance(owner, user1), amount);
    }

    function test_TransferFrom() public {
        uint256 amount = 75 * 10**DECIMALS;
        token.approve(user1, amount);
        
        vm.prank(user1);
        token.transferFrom(owner, user2, amount);
        
        assertEq(token.balanceOf(user2), amount);
        assertEq(token.allowance(owner, user1), 0);
    }



    function testFuzz_Transfer(uint256 amount) public {
        amount = bound(amount, 0, token.balanceOf(owner));
        
        token.transfer(user1, amount);
        assertEq(token.balanceOf(user1), amount);
    }
}
