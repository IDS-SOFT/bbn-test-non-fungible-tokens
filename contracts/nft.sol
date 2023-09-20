// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC721/extensions/ERC721Enumerable.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/utils/Counters.sol";

contract NFTTemplate is ERC721Enumerable, Ownable {
    using Counters for Counters.Counter;
    Counters.Counter private _tokenIdCounter;

    // Base URI for metadata (e.g., "https://api.example.com/token/")
    string private _baseTokenURI;
    event CheckBalance(string text, uint amount);

    constructor(string memory _name, string memory _symbol, string memory baseTokenURI) ERC721(_name, _symbol) {
        _baseTokenURI = baseTokenURI;
    }

    function setBaseURI(string memory baseTokenURI) external onlyOwner {
        _baseTokenURI = baseTokenURI;
    }

    function _baseURI() internal view override returns (string memory) {
        return _baseTokenURI;
    }

    function mint(address to) external onlyOwner {
        uint256 tokenId = _tokenIdCounter.current();
        _mint(to, tokenId);
        _tokenIdCounter.increment();
    }

    function burn(uint256 tokenId) external onlyOwner {
        _burn(tokenId);
    }
    
    function getBalance(address user_account) external returns (uint){
    
       string memory data = "User Balance is : ";
       uint user_bal = user_account.balance;
       emit CheckBalance(data, user_bal );
       return (user_bal);

    }
}
