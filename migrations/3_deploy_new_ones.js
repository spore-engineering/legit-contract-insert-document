const LegitAlmacenamiento = artifacts.require("LegitAlmacenamiento");

module.exports = function(deployer) {
    deployer.deploy(LegitAlmacenamiento);
};