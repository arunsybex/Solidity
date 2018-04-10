
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

