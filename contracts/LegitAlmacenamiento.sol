//SPDX-License-Identifier: MIT
pragma solidity >=0.5.0 <0.7.0;
pragma experimental ABIEncoderV2;

contract LegitAlmacenamiento {

    address private admin;

    mapping(string => string[]) public notas;

    constructor() public {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(
            msg.sender == admin,
            "Only admin can call this."
        );
        _;
    }

    function escribir( string memory _user, string memory _nota) public {
        notas[_user].push(_nota);
    }

    function leer( string memory _user) public view returns (string[] memory){
        return notas[_user];
    }

    function borrar(string memory _user, string memory _nota) public onlyAdmin returns(string[] memory) {

        for (uint i = 0; i < notas[_user].length; i++) {
            if(keccak256(abi.encodePacked(notas[_user][i])) == keccak256(abi.encodePacked(_nota))) {
                delete notas[_user][i];
            }
        }

        return notas[_user];
    }

    function total( string memory _user) public view returns(uint) {
        return notas[_user].length;
    }
}