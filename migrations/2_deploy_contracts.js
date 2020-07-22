//const Almacenamiento = artifacts.require("Almacenamiento");
const Legit = artifacts.require("Legit");

module.exports = function(deployer) {
    //deployer.deploy(Almacenamiento);
    deployer.deploy(Legit);
};