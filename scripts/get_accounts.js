(async () => {
  let accounts = await web3.eth.getAccounts();
  console.log("Accounts: ", accounts);
  // log number of accounts
  console.log("Number of accounts: ", accounts.length);
  const acc = accounts[0];
  const balance = await web3.eth.getBalance(acc);
  const balanceEth = web3.utils.fromWei(balance, "ether");
  console.log(`Balance of account 0: ${balanceEth} ETH ${balance} WEI`);
})();
