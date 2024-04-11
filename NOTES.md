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