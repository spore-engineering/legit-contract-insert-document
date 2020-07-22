const LegitSaveCertsContract = artifacts.require("LegitSaveCertsContract");

module.exports = function(deployer) {
    deployer.deploy(LegitSaveCertsContract);
};