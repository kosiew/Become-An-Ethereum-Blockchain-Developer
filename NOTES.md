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

• Fungible Tokens
• Tokens have no Serial number
• Send/transfer/approve
• Eventually mint/burn
• Transfer event
• Approve Event

## ERC20 Benefits and Drawbacks
### Pro
• Extremely easy to use
• Can represent anything fungible
    • Loyalty Points
    • Money
    • Casino Chips （Poker？）
• Can give allowance to other people

### Con
• Accidentally send Tokens to other contracts who cannot send them back
• Confusion around decimals
• No standardized mint/burn behavior
• Cannot react on receiving tokens

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


## ERC777
• Fungible Tokens
• Backwards compatible with ERC20
    • Can be, doesn't have to
• Receiving Smart Contracts need to implement and expose the ERC777 TokensSender interface
• Can add hooks to call other smart contracts when tokens are transferred
• Standard mint/burn events

## ERC777 Benefits vs Drawbacks
### Pro
• Backwards compatible to ERC20 Tokens
• Can prevent accidental transfer to locked in Contracts
• Has HOOKS

### Con
• Harder to implement
• Fallback/Override to send tokens to receiving contract sometimes necessary
• Not very widely in use （yet）

## ERC721
• First non-fungible token standard
• Like ERC20, but every token has an ID
• Behaves like deploying an ERC20 token with supply 1
• Send/transfer/approve
    • Like ERC20, but for each ID separately
• Transfer events
• Approve event

## ERC1155
• Like a marriage of ERC20 and ERC721
• Can have balance/supply > 1 for each ID
• No standard implementation
    • Opensea example: Can create a new Token （ID）， can then mint new Token for an existing ID
    • OpenZeppelin: Can mint an amount of tokens for a non-existing ID
• TransferSingle, TransferBatch events


## Truffle

https://consensys.io/blog/consensys-announces-the-sunset-of-truffle-and-ganache-and-new-hardhat?utm_source=github&utm_medium=referral&utm_campaign=2023_Sep_truffle-sunset-2023_announcement_

Truffle and Ganache are sunsetted and will be replaced by Hardhat. The Truffle Suite will be maintained until the end of 2023, and the team will focus on supporting the transition to Hardhat.


List of commonly used Truffle commands:

1. truffle init: Initializes a new Truffle project by creating a new directory with all the necessary files and folders for your project. This is usually the first command you run in a new project.

2. truffle compile: Compiles your smart contracts. This process converts your Solidity contracts into a format that the Ethereum Virtual Machine (EVM) can understand. The output is typically a set of JSON artifacts located in the build/contracts directory.

3. truffle migrate: Deploys your smart contracts to the Ethereum network. This is often used in tandem with a migration script located in the migrations directory that dictates how and in what order your contracts are deployed.

4. truffle test: Runs tests on your smart contracts. Truffle supports testing with JavaScript and Solidity and allows you to test your contracts thoroughly to ensure they behave as expected. Tests are located in the test directory.

5. truffle console: Opens an interactive console connected to your chosen Ethereum network. This is useful for direct interaction with your contracts, debugging, or querying contract state.

6. truffle develop: Starts a Truffle development environment, which includes a development blockchain you can use for testing. It also opens an interactive console where you can run Truffle commands directly.

7. truffle networks: Lists all networks to which your contracts have been deployed, including network ids and addresses of deployed contracts. This is useful for keeping track of where your contracts live across different networks.

8. truffle create contract <ContractName>: Generates a new contract file in the contracts directory. Replace <ContractName> with the desired name for your contract.

9. truffle create test <TestName>: Generates a new test file in the test directory. Replace <TestName> with the name of the contract or functionality you are testing.

10. truffle exec <script.js>: Executes a custom script within the Truffle environment. This can be used for complex deployment scripts, batch processing, or any other task that requires interaction with your contracts outside of migrations and tests.

### Truffle Dashboard

1. Start the Truffle Dashboard:

You can start the Truffle Dashboard by running the command truffle dashboard in your terminal. This command launches a local web server that hosts the Dashboard interface.

2. Connect to the Truffle Dashboard from your DApp:

Once the Dashboard is running, you can connect your decentralized application (DApp) or development environment to the Dashboard. This typically involves setting the Dashboard as your network endpoint in your Truffle configuration (truffle-config.js or truffle.js).

3. Deploy Contracts via the Dashboard:

With the Dashboard running and configured, you can deploy contracts using the Dashboard's interface. This involves selecting the appropriate network (such as a testnet like Goerli) and deploying your contracts directly from the Dashboard.

4. Verify Contract Source Code:

After deployment, the Truffle Dashboard may offer functionalities to verify your contract's source code on public testnets or mainnets. Verification involves submitting your contract's source code and metadata to a blockchain explorer service (like Etherscan for Ethereum networks) so that others can view and verify the code running on the blockchain.
As of my last update, direct source code verification through the Truffle Dashboard might not be as straightforward as using Truffle's truffle run verify command with plugin support (such as truffle-plugin-verify). If the Dashboard doesn't support direct verification, you would typically verify your contract's source code by manually submitting it to the blockchain explorer's verification tool or by using the command line as previously done.

5. Using the Dashboard for Other Tasks:

Beyond deployment and verification, the Truffle Dashboard allows for various interactions with your deployed contracts, network management, and potentially more features that Truffle may add over time to enhance smart contract development and management.


## How to deploy a contract using Truffle
1. Use Truffle to sign Transactions and connect to a blockchain node, either self-hosted or hosted. This way we need to either give Truffle a private key or the seed phrase. And you will need to download and run a node or need to sign up to a service like Infura, Alchemy or Pocket Network - there are many more.

2. Use Truffle Dashboard and connect MetaMask - this is more secure


## Ganache

Commonly used options:

Starting Ganache CLI: Simply running ganache-cli in your terminal starts a local Ethereum blockchain instance. By default, it listens on http://127.0.0.1:8545.

Specifying the Port (-p or --port): To start Ganache CLI on a specific port:
ganache-cli --port <port number>
Replace <port number> with your desired port number.

ganache-cli --accounts <number>
Determining Account Balance (-e or --defaultBalanceEther): To set the default balance for accounts:

ganache-cli --defaultBalanceEther <amount>
Using a Deterministic Account Generation (-d or --deterministic): For reproducible accounts:

ganache-cli --deterministic
Unlocking Accounts for Testing (--unlock): To unlock specific accounts for testing purposes:

ganache-cli --unlock <address>
Setting the Gas Price (-g or --gasPrice): To specify the gas price for transactions:

ganache-cli --gasPrice <gasPrice>
Setting the Gas Limit (-l or --gasLimit): To specify the block gas limit:

ganache-cli --gasLimit <gasLimit>
Mnemonic for Generating Accounts (-m or --mnemonic): To specify a mnemonic for generating accounts:

ganache-cli --mnemonic "<mnemonic>"
Network ID (-i or --networkId): To specify the network ID:

ganache-cli --networkId <id>
Forking from Another Blockchain (--fork): To fork Ganache CLI from another running blockchain (e.g., mainnet):

ganache-cli --fork <URL of the Ethereum client to fork>

## sample truffle-config.js - using truffle dashboard

```
module.exports = {

  networks: {

    ganache: {
     host: "127.0.0.1",     // Localhost (default: none)
     port: 8545,            // Standard Ethereum port (default: none)
     network_id: "*",       // Any network (default: none)
    },
  },

  // Set default mocha options here, use special reporters, etc.
  mocha: {
    // timeout: 100000
  },

  // Configure your compilers
  compilers: {
    solc: {
      version: "0.8.16",      // Fetch exact version from solc-bin (default: truffle's version)
      // docker: true,        // Use "0.5.1" you've installed locally with docker (default: false)
      settings: {          // See the solidity docs for advice about optimization and evmVersion
       optimizer: {
         enabled: false,
         runs: 200
       },
      //  evmVersion: "byzantium"
      }
    }
  },
  plugins: ['truffle-plugin-verify'],
  api_keys: {
    etherscan: fs.readFileSync(".etherscan").toString().trim()
  },

};
```

## Truffle Debugger commands

Commands：
（enter） last conmand entered （step next）
（o） step over，（i） step line / step into， （u） step out， （n） step next
（c） continue until breakpoint， （Y） reset & continue to previous error
（y） （if at end） reset & continue to final error
（；） step instruction （include number to step multiple）
（g） turn on generated sources， （G） turn off generated sources except via'；
（p） print instruction & state （'p ［memlcallsto］*； see docs for more）
（1） print additional source context （'1 ［+<lines-ahead>］［-<lines-back>］）
（s） print stacktrace，（h）print this help
load new transaction， （T）
（B） remove breakpoint （similar to adding, or B allto remove al1）
（+） add watch expression （+：<expr>），（-）remove watch expression （-：<expr>）
（？） list existing watch expressions and breakpoints
（v） print variables and values（'v［builglolcon|1oc］*）
（：） evaluate expression - see"v'


## Hardhat

Hardhat can generate Typescript project

install hardhat with npm install --save-dev hardhat

## Foundry

`forge` command

tests do not use `describe` like hardhat, truffle

