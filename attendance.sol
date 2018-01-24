pragma solidity ^0.4.11;


contract details{
    
    struct detail{
        
        uint256 p_days;
        uint256 a_days;
        
    }
    
    mapping(address => detail) public wor;
    
}


contract atten is details{
     
    
    
     
    function present(address _pre) public{
        wor[_pre].p_days += 1 ;
    } 
    
    function ab(address _ab) public{
        wor[_ab].a_days += 1 ;
    }
}
