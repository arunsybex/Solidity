pragma solidity ^0.4.16;

contract Token{
    function totalSupply() constant returns (uint256 supply) {}
    function balanceOf(address _owner) constant returns (uint256 balance) {}
    function transfer(address _to, uint256 _value) returns (bool success) {}
    function transferFrom(address _from, address _to, uint256 _value) returns (bool success) {}
    function approve(address _spender, uint256 _value) returns (bool success) {}
    function allowance(address _owner, address _spender) constant returns (uint256 remaining) {}
    
    event Transfer(address indexed _from, address indexed _to, uint256 _value);
    event Approval(address indexed _owner, address indexed _spender, uint256 _value);
}

contract StandardToken is Token{
    
     mapping (address => uint256) balances;
     mapping(address => mapping(address => uint256)) alowed;
     uint256 public totalSupply;
     
     
     function transfer(address _to,uint256 _value) returns(bool success) {
         if (balances[msg.sender] >= _value && _value > 0 ){
             
             balances[msg.sender] -= _value;
             balances[_to] += _value;
             Transfer(msg.sender,_to,_value);
             return true;
         }
         else{
             return false;
         }
     }
     
     function transferFrom(address _from,address _to,uint256 _value) returns(bool success) {
         if (balances[_from] >= _value && _value > 0 && alowed[_from][_to] >= _value){
             
             balances[_from] -= _value;
             balances[_to] += _value;
             alowed[_from][_to] -= _value;
             Transfer(_from,_to,_value);
             return true;
         }
         else{
             return false;
         }
     }
     
     function balanceOf(address _owner) constant returns(uint256 balance){
         return balances[_owner];
     }
     
     function approve(address _spender,uint256 _value) returns(bool success){
         alowed[msg.sender][_spender] = _value;
         Approval(msg.sender,_spender,_value);
         return true;
     }
     
     
     function allowance(address _owner,address _spender) constant returns(uint256 remaining){
         return alowed[_owner][_spender];
     }
     
}

contract TestCoin is StandardToken{
    
    string public name;
    uint8 public decimals;
    string public symbol;
    uint256 public unitsOneEthCanBuy;
    uint256 public totalEth;
    address public Wallet;
    
    
    function TestCoin(){
        balances[msg.sender] = 5 * 1 ether;
        totalSupply = 5 * 1 ether;
        Wallet = msg.sender;
        name = "MNW Token";
        symbol = "MNW";
        decimals = 18;
        
    }
    
    function() payable{
        totalEth = totalEth + msg.value;
        uint256 amount = msg.value * unitsOneEthCanBuy;
        if (balances[Wallet] < amount) {
            return;
        }

        balances[Wallet] = balances[Wallet] - amount;
        balances[msg.sender] = balances[msg.sender] + amount;

        Transfer(Wallet, msg.sender, amount); // Broadcast a message to the blockchain

        //Transfer ether to fundsWallet
        Wallet.transfer(msg.value);                               
    }

    
}
