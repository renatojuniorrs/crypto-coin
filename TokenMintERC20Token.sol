pragma solidity ^0.5.0;
contract TokenMintERC20Token is ERC20 {
    string private _name;
    string private _symbol;
    uint8 private _decimals;
    
    constructor(string memory name, string memory symbol, uint8 decimals, uint256 totalSupply, address payable feeReceiver, address tokenOwnerAddress) public payable {
      _name = name;
      _symbol = symbol;
      _decimals = decimals;
      
      _mint(tokenOwnerAddress, totalSupply);
      
      feeReceiver.transfer(msg.value);
    }
    
    function burn(uint256 value) public {
      _burn(msg.sender, value);
    }
    
    
    function name() public view returns (string memory) {
      return _name;
    }
    
    function symbol() public view returns (string memory) {
      return _symbol;
    }
    
    function decimals() public view returns (uint8) {
      return _decimals;
    }
}
