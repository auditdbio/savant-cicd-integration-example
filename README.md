# MyToken - ERC20 Token

This is an ERC20 token project created using Foundry and OpenZeppelin Contracts.

## Description

MyToken is a standard ERC20 token with additional features:
- Token minting (owner only)
- Token burning
- Access control management through Ownable

## Technical Specifications

- **Name**: MyToken
- **Symbol**: MTK
- **Decimals**: 18
- **Initial Supply**: 1,000,000 tokens
- **Standard**: ERC20

## Functions

### Standard ERC20 functions:
- `transfer(address to, uint256 amount)` - Transfer tokens
- `approve(address spender, uint256 amount)` - Approve spending
- `transferFrom(address from, address to, uint256 amount)` - Transfer on behalf of another address
- `balanceOf(address account)` - Account balance
- `allowance(address owner, address spender)` - Approved amount for spending

### Additional functions:
- `mint(address to, uint256 amount)` - Mint tokens (owner only)
- `burn(uint256 amount)` - Burn own tokens
- `burnFrom(address account, uint256 amount)` - Burn tokens from another account (with approval)

## Installation

```bash
# Clone the repository
git clone <repository-url>
cd soldility-cicd-test

# Install dependencies
forge install

# Compile contracts
forge build
```

## Testing

```bash
# Run all tests
forge test

# Run tests with verbose output
forge test -v

# Run specific test
forge test --match-test test_Transfer
```

## Deployment

```bash
# Deploy to local network
forge script script/MyToken.s.sol --fork-url http://localhost:8545 --broadcast

# Deploy to testnet (e.g., Sepolia)
forge script script/MyToken.s.sol --fork-url $SEPOLIA_RPC_URL --broadcast --verify
```

## Project Structure

```
├── src/
│   └── MyToken.sol          # Main token contract
├── script/
│   └── MyToken.s.sol        # Deployment script
├── test/
│   └── MyToken.t.sol        # Tests
├── lib/
│   └── openzeppelin-contracts/  # OpenZeppelin libraries
└── foundry.toml             # Foundry configuration
```

## Security

The contract uses verified OpenZeppelin libraries:
- `ERC20.sol` - Standard ERC20 implementation
- `Ownable.sol` - Access control management

## License

UNLICENSED
