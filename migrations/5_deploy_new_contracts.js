const LegitContractV2 = artifacts.require("LegitContractV2");

module.exports = function(deployer) {
    deployer.deploy(LegitContractV2);
};