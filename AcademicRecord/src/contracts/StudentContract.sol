pragma solidity ^0.8.0;

import './FileContract.sol';
import './UserContract.sol';

contract StudentContract is UserContract {
    FileContract public filecontract;

    event FileContractLinked(address indexed fileContractAddress);

    constructor(address _fileaddress) {
        require(_fileaddress != address(0), "Invalid file contract address");
        filecontract = FileContract(_fileaddress);
        emit FileContractLinked(_fileaddress);
    }

    function linkFileContract(address _fileaddress) public {
        require(_fileaddress != address(0), "Invalid file contract address");
        filecontract = FileContract(_fileaddress);
        emit FileContractLinked(_fileaddress);
    }
}
