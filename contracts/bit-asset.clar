;; Title: BitAsset - Collateralized NFTs on Stacks
;;
;; Summary:
;; A comprehensive NFT contract with collateralization, fractional ownership, staking, and
;; marketplace functionality built for the Stacks ecosystem, enabling direct Bitcoin asset
;; representation through verifiable NFTs.
;;
;; Description:
;; This contract enables the creation, trading, and management of asset-backed NFTs on the
;; Stacks blockchain with Bitcoin compatibility. Features include:
;;  - Collateralized NFT minting with minimum collateral ratios
;;  - Secondary market trading with protocol fees
;;  - Fractional ownership and transferability
;;  - NFT staking with yield generation
;;  - Verifiable asset representation with customizable URIs

;; Constants

(define-constant contract-owner tx-sender)
(define-constant err-owner-only (err u100))
(define-constant err-not-token-owner (err u101))
(define-constant err-insufficient-balance (err u102))
(define-constant err-invalid-token (err u103))
(define-constant err-listing-not-found (err u104))
(define-constant err-invalid-price (err u105))
(define-constant err-insufficient-collateral (err u106))
(define-constant err-already-staked (err u107))
(define-constant err-not-staked (err u108))
(define-constant err-invalid-percentage (err u109))
(define-constant err-invalid-uri (err u110))
(define-constant err-invalid-recipient (err u111))
(define-constant err-overflow (err u112))

;; Data Variables

(define-data-var min-collateral-ratio uint u150) ;; 150% minimum collateral ratio
(define-data-var protocol-fee uint u25) ;; 2.5% fee in basis points
(define-data-var total-staked uint u0)
(define-data-var yield-rate uint u50) ;; 5% annual yield rate in basis points
(define-data-var total-supply uint u0)

;; Data Maps

(define-map tokens
  { token-id: uint }
  {
    owner: principal,
    uri: (string-ascii 256),
    collateral: uint,
    is-staked: bool,
    stake-timestamp: uint,
    fractional-shares: uint,
  }
)

(define-map token-listings
  { token-id: uint }
  {
    price: uint,
    seller: principal,
    active: bool,
  }
)

(define-map fractional-ownership
  {
    token-id: uint,
    owner: principal,
  }
  { shares: uint }
)

(define-map staking-rewards
  { token-id: uint }
  {
    accumulated-yield: uint,
    last-claim: uint,
  }
)