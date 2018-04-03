pragma solidity ^0.4.13;

contract ERC20 {
    function totalSupply() public constant returns (uint);
    function balanceOf(address tokenOwner) public constant returns (uint balance);
    function allowance(address tokenOwner, address spender) public constant returns (uint remaining);
    function transfer(address to, uint tokens) public returns (bool success);
    function approve(address spender, uint tokens) public returns (bool success);
    function transferFrom(address from, address to, uint tokens) public returns (bool success);

    event Transfer(address indexed from, address indexed to, uint tokens);
    event Approval(address indexed tokenOwner, address indexed spender, uint tokens);
}

contract Token{
    
    function totalSupplytoken(address _token) public view returns(uint){
        return ERC20(_token).totalSupply();
    }
    
    function balanceOftoken(address _token) public view returns(uint){
        return ERC20(_token).balanceOf(_token);
    }
    
    // before this You need to run approve function on your token contract...
    function transfertoken(address _token,address _to,uint _amt) public payable {
        ERC20(_token).transferFrom(msg.sender,_to,_amt);
    }
    
}
