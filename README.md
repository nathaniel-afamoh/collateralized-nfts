# BitAsset: Collateralized NFTs on Stacks

**BitAsset** is a comprehensive smart contract that enables the creation, trading, staking, and fractional ownership of asset-backed NFTs on the Stacks blockchain. Designed to represent Bitcoin-compatible assets in a verifiable, decentralized, and modular framework, BitAsset introduces advanced NFT mechanics, including collateralization and yield generation.

## Overview

BitAsset empowers users to mint NFTs collateralized by STX, enabling real-world asset representation on-chain with the following features:

* **Collateralized NFT Minting**
* **Marketplace with Listing & Purchase Capabilities**
* **Fractional Ownership with Transferability**
* **NFT Staking for Passive Yield Generation**
* **Verifiable Metadata with Custom URIs**
* **Built-in Protocol Fees to Fund Sustainability**

## Features

### Collateralized NFT Minting

* Users can mint NFTs by locking STX as collateral.
* A minimum collateralization ratio (default 150%) ensures financial backing.
* NFT metadata is stored as a 256-character ASCII URI.

### Marketplace

* NFTs can be listed and purchased via the built-in marketplace.
* Protocol fees (default 2.5%) are charged to sustain contract operations.
* Listings are validated for ownership and staking status.

### Fractional Ownership

* NFTs can be divided into fractional shares.
* Ownership of shares is transferable between principals.
* All share operations check for overflow and validity.

### NFT Staking & Yield

* NFT owners can stake their NFTs to earn yield.
* Yield is calculated per block (default 5% APY).
* Rewards are claimable and paid in STX.

## Contract Structure

### Constants

| Name                   | Description                                        |
| ---------------------- | -------------------------------------------------- |
| `contract-owner`       | Initial contract deployer                          |
| `min-collateral-ratio` | Minimum collateral ratio (default: 150%)           |
| `protocol-fee`         | Marketplace fee in basis points (default: 25)      |
| `yield-rate`           | Annual staking yield in basis points (default: 50) |

### Maps

| Name                   | Description                                         |
| ---------------------- | --------------------------------------------------- |
| `tokens`               | NFT data (ownership, URI, collateral, stake status) |
| `token-listings`       | Listings with price, seller, and status             |
| `fractional-ownership` | Mapping of share amounts per user per NFT           |
| `staking-rewards`      | Tracks staking yield and last claim block           |

## Core Public Functions

### NFT Operations

* `mint-nft(uri, collateral)`
* `transfer-nft(token-id, recipient)`

### Marketplace

* `list-nft(token-id, price)`
* `purchase-nft(token-id)`

### Fractional Shares

* `transfer-shares(token-id, recipient, share-amount)`

### Staking

* `stake-nft(token-id)`
* `unstake-nft(token-id)`

## Read-Only Functions

* `get-token-info(token-id)`
* `get-listing(token-id)`
* `get-fractional-shares(token-id, owner)`
* `get-staking-rewards(token-id)`
* `calculate-rewards(token-id)`

## Validation & Utility

* URI and recipient address validation
* Safe arithmetic operations with overflow checks
* Internal reward claiming logic during unstaking

## Error Codes

| Code   | Meaning                   |
| ------ | ------------------------- |
| `u100` | Owner-only access         |
| `u101` | Caller is not token owner |
| `u102` | Insufficient balance      |
| `u103` | Invalid token ID          |
| `u104` | Listing not found         |
| `u105` | Invalid price             |
| `u106` | Insufficient collateral   |
| `u107` | NFT already staked        |
| `u108` | NFT not staked            |
| `u109` | Invalid percentage        |
| `u110` | Invalid URI               |
| `u111` | Invalid recipient         |
| `u112` | Arithmetic overflow       |

## Security Considerations

* Ownership and staking status are enforced at every operation.
* Collateral ratios ensure financial soundness.
* Internal checks guard against overflows and invalid inputs.
* Protocol fees and yield distributions are executed securely via `stx-transfer?`.

## Contributing

Contributions are welcome! To propose features, report bugs, or open pull requests.

## Future Enhancements

* Governance controls for adjusting parameters
* DAO integration for community-managed assets
* Cross-chain token bridges for BTC-native NFT support
* NFT lending and collateral liquidation mechanics

## Get Started

Deploy on the Stacks blockchain using Clarity tools such as [Clarinet](https://docs.hiro.so/clarity/overview) or interact with the contract via a frontend built with Stacks.js.
