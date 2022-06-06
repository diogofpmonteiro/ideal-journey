// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.1;
import "@openzeppelin/contracts/access/AccessControlEnumerable.sol";
import "@openzeppelin/contracts/token/ERC1155/IERC1155Receiver.sol";
import "@openzeppelin/contracts/token/ERC1155/IERC1155.sol";
import "@openzeppelin/contracts/utils/introspection/ERC165.sol";
import "@openzeppelin/contracts/utils/Context.sol";
import "@openzeppelin/contracts/utils/Counters.sol";

interface IProposal is IERC1155Receiver {
    event Accept(
        uint256 saleId,
        uint256 proposalId,
        address seller,
        address buyer,
        uint256 assetId,
        uint256 amount,
        uint256 price
    );

    event ListingEnded(uint256 saleId);

    event Propose(
        uint256 saleId,
        uint256 proposalId,
        address seller,
        address buyer,
        uint256 assetId,
        uint256 amount,
        uint256 price
    );

    event List(uint256 saleId, address seller, uint256 assetId, uint256 amount);

    event CancelProposal(
        uint256 saleId,
        uint256 proposalId,
        address seller,
        address buyer,
        uint256 assetId
    );

    event Cancel(
        uint256 saleId,
        address seller,
        uint256 assetId,
        uint256 amount
    );

    function list(uint256 _assetId, uint256 _amount) external;

    function propose(uint256 _saleId, uint256 _amount)
        external
        payable
        returns (bool);

    function accept(uint256 _saleId, uint256 _proposalId)
        external
        returns (bool);

    function cancelPropose(uint256 _saleId, uint256 _proposalId) external;

    function cancelListing(uint256 _saleId) external;
}

contract TokenProposals {
    using Counters for Counters.Counter;
    Counters.Counter private _salesIDs;
    Counters.Counter private _proposalIDs;
    address private owner;

    constructor() {
        owner = msg.sender;
    }

    struct Proposal {
        address owner;
        address buyer;
        uint256 assetId;
        uint256 price;
    }

    function list(uint256 _assetId, uint256 _amount) external {
        // initialize variables and function logic

        // emit list event
        emit List(_assetId, seller, _assetId, _amount);
    }

    function propose(uint256 _saleId, uint256 _amount)
        external
        payable
        returns (bool)
    {
        // initialize variables and function logic

        // emit event
        emit Propose(
            saleId,
            proposalId,
            msg.sender,
            "buyer",
            "assetId",
            amount,
            price
        );
    }

    function accept(uint256 _saleId, uint256 _proposalId)
        external
        returns (bool)
    {
        // initialize and logic
        // emit event
    }
}
