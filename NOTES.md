While receiving Ether is a common requirement, it comes with security considerations. Contracts must be designed to handle Ether securely, protecting against vulnerabilities such as reentrancy attacks, and ensuring that only authorized entities can withdraw or manage the funds. Additionally, the intentions and mechanisms around receiving and using Ether should be clear to users and auditors to prevent misunderstandings or misuse.


Here are a few common scenarios where contracts are designed to receive Ether:

1. Wallet Contracts
These are perhaps the most straightforward example. Wallet contracts can receive, store, and send Ether to other addresses, acting much like traditional bank accounts but with added programmability and features such as multi-signature authentication.

2. Crowdfunding and ICOs
Initial Coin Offerings (ICOs) and crowdfunding platforms use smart contracts to collect Ether from participants. These contracts often include logic to track contributions, issue tokens in return, and enforce rules around minimum funding goals or deadlines.

3. DeFi Platforms
Decentralized Finance (DeFi) protocols extensively use smart contracts that receive, hold, and transact Ether as part of their operations. This includes lending platforms, yield farming protocols, decentralized exchanges (DEXs), and more. In these cases, Ether is often used as collateral or for liquidity provision.

4. Games and NFT Marketplaces
Ethereum-based games and Non-Fungible Token (NFT) marketplaces often have contracts that manage Ether transactions. For example, purchasing an NFT or placing a bid in an auction typically involves sending Ether to a contract.

5. Payment and Subscription Services
Contracts can manage recurring payments or subscriptions, where users deposit Ether to pay for ongoing services or access to content.


With on-chain wallets, you get a lot more flexibility than with your traditional private-key based wallet. You can implement things like:

Multi-Signature Transaction Whitelisting, where it needs m-out-of-n people to agree to a transaction
Emergency operations, like account freezing, or withdrawal limits per day/month, ...
Whitelisting and Account Sharing
Account Recovery by using m-out-of-n people to reset an owner, or re-authorize a new person.
And for the sophisticated DeFi Traders out there, there are functions that help save gas costs, bundle transactions and templates to execute transactions to deleverage positions etc...


## Events
• Events are used for return values, data store or trigger
• Events can not be retrieved from within Smart Contracts
• Event arguments marked as indexed can be searched for
• Events are cheap


## Storage

When we develop smart contracts, we have available different types of storage:

Volatile stack access: Stack
Volatile memory access: Memory
Non-volatile: storage

Stack is used implicitly by Solidity for managing small and temporary variables.
Memory is explicitly declared and used for temporary storage of data within a transaction.
Storage is for permanent data stored on the blockchain, representing the contract's state.


A transaction on the Ethereum blockchain can be anything that modifies the state of the blockchain. This includes transferring Ether, interacting with a smart contract by changing its state, or creating a new smart contract.

## ERC20

An ERC20 contract is a standard interface for fungible tokens, which are tokens that have the same value and properties as every other token of the same type. This standard allows for the implementation of a standard API for tokens within smart contracts on the Ethereum blockchain. ERC stands for Ethereum Request for Comments, and 20 is the proposal identifier number.

The ERC20 standard specifies a set of functions and events that an Ethereum token contract has to implement to enable interoperability across multiple interfaces and platforms, such as wallets and decentralized exchanges. This standardization ensures that tokens can be exchanged or transferred in a predictable way across the Ethereum ecosystem.

## ERC20 Token Standard Use Cases
The ERC20 standard is widely used for creating and issuing smart contracts for tokens on the Ethereum blockchain, especially for:

Digital currencies
Governance tokens
Utility tokens in decentralized applications (dApps)
Its adoption as a standard has facilitated the growth of the decentralized finance (DeFi) ecosystem by ensuring that tokens created on different projects can interact seamlessly with each other, such as being exchangeable on decentralized exchanges (DEXes) without the need for a third party.

## Key Functions of the ERC20 Standard
The ERC20 standard defines several key functions that a compliant contract must include:

- totalSupply: Returns the total token supply.
- balanceOf(address account): Returns the account balance of another account with address account.
- transfer(address to, uint256 amount): Transfers amount of tokens to address to, and MUST fire the Transfer event. The function SHOULD throw if the message caller’s account balance does not have enough tokens to spend.
- approve(address spender, uint256 amount): Allows spender to withdraw from your account multiple times, up to the amount. If this function is called again it overwrites the current allowance with amount.
- transferFrom(address from, address to, uint256 amount): Transfers amount of tokens from address from to address to, and MUST fire the Transfer event.
- allowance(address owner, address spender): Returns the amount which spender is still allowed to withdraw from owner.

## Key Events of the ERC20 Standard
- Transfer(address indexed from, address indexed to, uint256 value): MUST trigger when tokens are transferred, including zero value transfers.
- Approval(address indexed owner, address indexed spender, uint256 value): MUST trigger on any successful call to approve(address spender, uint256 value).
