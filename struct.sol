pragma solidity ^0.4.0;

contract test{
    
    struct a{
        string name;
        uint64 age;
    }
    
    mapping(address => a) ad;
    
    function putadd(address _add,string _name,uint64 _age){
        ad[_add].name = _name;
        ad[_add].age = _age;
    }
    
    function getadd(address _add) constant returns(string,uint64){
        return(ad[_add].name,ad[_add].age);
    }
}
