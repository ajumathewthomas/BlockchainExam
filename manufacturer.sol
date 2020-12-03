pragma solidity >=0.4.22 <0.7.0;
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC721/ERC721.sol";

@Author AMT
contract manufacturers is ERC721 {
    
    address owner;
    mapping(uint256 =>food_manufacturers) foodorders;

    
    struct food_manufacturers {
        
        
        string product_name; // Name of the food commodity
        string brand_name;
        string product_type; // Type of FOod commodity
        uint256 quantity; //Quantity 
        uint256 rate;  // Rate of the product
    
        string region; // Region of Manufacturer
        uint256 total; // total 
        
        
        
    } food_manufacturers food_producer;
    
     constructor() ERC721("Food","FUD") public {
        owner = msg.sender;
    }
    modifier isOwner() {

         require(msg.sender == owner, "Access is not allowed");

         _;
         
    }
    
    function namedecl() public view  returns (string memory) {
         //calling the Built-in function in ERC721
        return name();
    }
    
    
    /**
     * @dev Function to display symbol of the token 
    */
     function symboldecl() public view  returns (string memory) {
         //calling the Built-in function in ERC721
        return symbol();
    }
    
    
    function addFoodProducts(uint256 _prodID,string memory _prodName,string memory _brandName, string memory _prodType, uint256 _quantity, uint256 _rate, string memory _region) public isOwner {
     
     _mint(msg.sender,_prodID);
     
     food_producer.product_name = _prodName;
     food_producer.brand_name = _brandName;
     food_producer.product_type = _prodType;
     food_producer.quantity = _quantity;
     food_producer.rate = _rate;
     food_producer.region = _region;
     food_producer.total = _rate * quantity;
     foodorders[_prodID] = food_producer;
     
    }
    
     function viewFoodProducts(uint256 _prodID) public view returns (string memory,string memory,string memory,uint256,uint256,string memory,uint256){
        
        food_manufacturers memory food_producer = foodorders[_prodID];
        return(food_producer.product_name,food_producer.brand_name,food_producer.product_type,food_producer.quantity,food_producer.rate,food_producer.region,food_producer.total);
        
    }
    
    function transferOwnership(address from, address to, uint256 _prodID) public  {
        
        //Calling the Built-in function in ERC721
        _transfer(from, to, _prodID);
        
    }
    
 
 function deleteProduct (uint256 _prodID) public isOwner {
     
     // To delete the Product
         
        
        _burn( _prodID);
        
    }
    
    
    
    
    
}