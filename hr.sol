pragma solidity ^0.4.0;

contract HR{
    struct can{
        string name;
        uint8 age;
        string addres;
        bool sel;
    }
    
    mapping (address => can) candidate;
    
    function entry(address _key,string name,uint8 age,string addres){
                candidate[_key].name = name;
                candidate[_key].age = age;
                candidate[_key].addres = addres;
                candidate[_key].sel = true;
    }
    
    function check(address _key) public constant returns(string){
        if (candidate[_key].sel){ return "All ready registered...!";}
        else{ return "New"; }
    }
}
