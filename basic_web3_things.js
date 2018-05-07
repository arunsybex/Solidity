
  basicfunctions : function(){
    
    $("#account").val(account)
    
    web3.eth.getBalance(account, (err, balance) => {
      balance = web3.fromWei(balance, "ether") + ""
      console.log(balance)
      $("#balance").val(balance.trim())
    });
  },

token_name : function(){
  MetaCoin.deployed().then(function(f) {
    f.name.call().then(function(f) {
      console.log(f)
    })
  })
},
token_symbol : function(){
  MetaCoin.deployed().then(function(f) {
    f.synbol.call().then(function(f) {
      console.log(f)
    })
  })
}

// Detect MetaMask address Changes //

var account = web3.eth.accounts[0];
var accountInterval = setInterval(function() {
  if (web3.eth.accounts[0] !== account) {
    account = web3.eth.accounts[0];
    // your actions
  }
}, 100);

