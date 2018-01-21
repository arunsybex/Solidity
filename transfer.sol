pragma solidity ^0.4.0;

contract Bank{
    
    address public owner;
    mapping (address => uint) balence;
    
    function Bank(){
        owner = msg.sender;
    }
    
    event Delivered(address owner,address reci,uint amount);
    
    modifier myFun{
        require(msg.sender == owner);
        _;
    }
    
    function create(address _add,uint amount) myFun{
        if(msg.sender != owner) throw;
        balence[_add] = amount;
    }
    
    function transfer(address _rec,uint amount){
        if (balence[msg.sender] < amount) throw;
        balence[msg.sender] -= amount;
        balence[_rec] += amount;
        Delivered(owner,_rec,amount);
    }
    
    function bal(address _rec) constant returns(uint){
        return balence[_rec];
    }
}
