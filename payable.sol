pragma solidity ^0.4.16;

contract pay{
    
    uint256 public a;
    
    function pay() public{
        a = 5;
    }
    
    modifier check(uint256 _a) {
        require(_a > 0);
        _;
    }
    
    function add(uint256 _a) check(_a) payable public {
        a  = _a;
    }
    
    function sub(uint256 _a,uint256 _b) pure public returns(uint256){
        return _a - _b;
    }
}
