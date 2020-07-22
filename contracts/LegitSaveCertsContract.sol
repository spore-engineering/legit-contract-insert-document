//SPDX-License-Identifier: MIT
pragma solidity >=0.5.0 <0.7.0;
pragma experimental ABIEncoderV2;

contract LegitSaveCertsContract {

    address private admin;

    mapping(string => string[]) public certs;

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
        certs[_user].push(_nota);
    }

    function leer( string memory _user) public view returns (string[] memory){
        return certs[_user];
    }

    function borrar(string memory _user, string memory _nota) public onlyAdmin returns(string[] memory) {

        for (uint i = 0; i < certs[_user].length; i++) {
            if(keccak256(abi.encodePacked(certs[_user][i])) == keccak256(abi.encodePacked(_nota))) {
                delete certs[_user][i];
            }
        }

        return certs[_user];
    }

    function total( string memory _user) public view returns(uint) {
        return certs[_user].length;
    }
}