//SPDX-License-Identifier: MIT
pragma solidity >=0.5.0 <0.7.0;
pragma experimental ABIEncoderV2;

contract Legit {
    
    
    mapping(address => string[]) public notas;

    constructor() public {
        
    }

    function escribir(string memory _nota) public {
        notas[msg.sender].push(_nota);
    }

    function leer() public view returns (string[] memory){
        return notas[msg.sender];
    }

    function total() public view returns(uint) {
        return notas[msg.sender].length;
    }
}