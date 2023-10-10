// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC721/extensions/ERC721Enumerable.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract NFTTemplate is ERC721Enumerable, Ownable {
    string private _baseTokenURI;
    uint256 tokenIdCounter = 0;

    event CheckBalance(uint amount);

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
        require(to != address(0), "Invalid address");

        uint256 tokenId = tokenIdCounter;
        _mint(to, tokenId);
        tokenIdCounter +=1;
    }

    function burn(uint256 tokenId) external onlyOwner {
        _burn(tokenId);
    }
    
    function getBalance(address user_account) external returns (uint){
       uint user_bal = user_account.balance;
       emit CheckBalance(user_bal);
       return (user_bal);
    }
}
