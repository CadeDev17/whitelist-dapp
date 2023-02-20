// SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

contract Whitelist {
    // Max number of whitelisted addresses
    uint8 public maxWhitelistedAddresses;

    // Number of whitelisted addresses at any given time
    uint8 public numAddressesWhitelisted;

    // This tells us if an address has been whitelisted
    mapping(address => bool) public whitelistedAddresses;

    constructor(uint8 _maxWhitelistedAddresses) {
        maxWhitelistedAddresses = _maxWhitelistedAddresses;
    }

    // If address is not currently whitelisted AND there are still available whitelist spots
    // then go ahead and add the address that called this function to the whitelist and set it to true in the mapping
    function addAddressToWhitelist() public {
        require(!whitelistedAddresses[msg.sender], "Sender alread in whitelist.");
        require(numAddressesWhitelisted < maxWhitelistedAddresses, "Max limit reached!");
        whitelistedAddresses[msg.sender] = true;
        numAddressesWhitelisted++;
    }
}