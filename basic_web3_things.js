
  basicfunctions : function(){
    
    $("#account").val(account)
    
    web3.eth.getBalance(account, (err, balance) => {
      balance = web3.fromWei(balance, "ether") + ""
      console.log(balance)
      $("#balance").val(balance.trim())
    });
  }
