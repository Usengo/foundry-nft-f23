// SPDX-License-Identifier: MIT

pragma solidity ^0.8.20;

import {Test, console} from "forge-std/Test.sol";
import {DeployMoodNft} from "../../script/DeployMoodNft.s.sol";

contract DeployMoodNftTest is Test {
    DeployMoodNft public deployer;

    function setUp() public {
        deployer = new DeployMoodNft();
    }

    function testConvertSvgToUri() public view {
        string memory expectUri = "data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cHM6Ly93d3cudzMub3JnLzIwMDAvc3ZnIiB3aWR0aD0iNTAwIiBoZWlnaHQ9IjUwMCI+PHRleHQgeD0iMCIgeT0iMTUiIGZpbGw9InllbGxvdyI+IGhpISBZb3UgZGVjb2RlZCB0aGlzISA8L3RleHQ+PC9zdmc+";
        string memory svg = '<svg xmlns="https://www.w3.org/2000/svg" width="500" height="500"><text x="0" y="15" fill="yellow"> hi! You decoded this! </text></svg>';
        string memory actualUri = deployer.svgToImageURI(svg);
        assert(
            keccak256(abi.encodePacked(actualUri)) ==
            keccak256(abi.encodePacked(expectUri))
        );
    }

}