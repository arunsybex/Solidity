pragma solidity ^0.4.11;


contract shop {
    
    struct pro{
        string name;
        string sku;
        uint256 price;
        bool stock;
    }
    
    mapping (string => pro) product;
    
    
    function shop(string _sku, string _name,uint256 _price,bool _stock) public{
        product[_sku].name = _name;
        product[_sku].sku = _sku;
        product[_sku].price = _price;
        product[_sku].stock = _stock;
    }
    
    function add(string _sku, string _name,uint256 _price,bool _stock) public {
        
        product[_sku].name = _name;
        product[_sku].sku = _sku;
        product[_sku].price = _price;
        product[_sku].stock = _stock;
     
    }
    
    function getdetails(string _sku) view public returns(uint256){
        
        if (product[_sku].stock)
        {
            return product[_sku].price;
        }
    }
    
    
}
