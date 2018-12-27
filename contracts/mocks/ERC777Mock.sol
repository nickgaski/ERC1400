pragma solidity ^0.4.24;
import "../token/ERC777/ERC777Mintable.sol";
import "./CertificateControllerMock.sol";


contract ERC777Mock is ERC777Mintable, CertificateControllerMock {

  constructor(
    string name,
    string symbol,
    uint256 granularity,
    address[] controllers,
    address certificateSigner
  )
    public
    ERC777(name, symbol, granularity, controllers, certificateSigner)
  {
  }

  function addController(address operator) external onlyOwner {
    _addController(operator);
  }

  function removeController(address operator) external onlyOwner {
    _removeController(operator);
  }

  function isRegularAddress(address adr) external view returns(bool) {
    return _isRegularAddress(adr);
  }

  function redeemFromMock(address from, uint256 value, bytes data, bytes operatorData) external {
    _redeem(msg.sender, from, value, data, operatorData);
  }

}
