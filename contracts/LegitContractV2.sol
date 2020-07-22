//SPDX-License-Identifier: MIT
pragma solidity >=0.5.0 <0.7.0;
pragma experimental ABIEncoderV2;

contract LegitContractV2 {

    struct Certificacion {
        string id_certificacion;
        string nombre_responsable;
        string nombre_certificacion;
        string fecha;
        string cantidad_documentos;
        string[] documentos_hash;
        string[] documentos_nombre;
    }

    mapping(string => Certificacion[]) private certificaciones;

    string[] private documentos;
    address private admin;

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

    function certifica(
        string memory _id_cert,
        string memory _user_name,
        string memory _user_email,
        string memory _fecha,
        string memory _cert_name,
        string memory _n_doc,
        string[] memory _docs_hash,
        string[] memory _docs_nombre
        )
    public {

        string[] memory arreglo_hash_doc = _docs_hash;
        string[] memory arreglo_nombre_doc = _docs_nombre;

        for (uint i = 0; i < arreglo_hash_doc.length; i++) {
            documentos.push(arreglo_hash_doc[i]);
        }

        Certificacion memory _nueva_cert = Certificacion({
            id_certificacion: _id_cert,
            nombre_responsable: _user_name,
            fecha: _fecha,
            nombre_certificacion: _cert_name,
            cantidad_documentos: _n_doc,
            documentos_hash: arreglo_hash_doc,
            documentos_nombre: arreglo_nombre_doc
        });

        certificaciones[_user_email].push(_nueva_cert);
    }

    function valida(string memory _document_hash) public view returns (bool) {

        for (uint i = 0; i < documentos.length; i++) {
            if(keccak256(abi.encodePacked(documentos[i])) == keccak256(abi.encodePacked(_document_hash))) {
                return true;
            }
        }

        return false;
    }

    function busca(string memory _user_email) public view returns (Certificacion[] memory) {
        return certificaciones[_user_email];
    }
}