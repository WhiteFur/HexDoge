// SPDX-License-Identifier: MIT
// OpenZeppelin Contracts (last updated v4.5.0) (token/ERC1155/presets/ERC1155PresetMinterPauser.sol)

pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC1155/ERC1155.sol";
import "@openzeppelin/contracts/token/ERC1155/extensions/ERC1155Burnable.sol";
import "@openzeppelin/contracts/token/ERC1155/extensions/ERC1155Pausable.sol";
import "@openzeppelin/contracts/token/ERC1155/utils/ERC1155Holder.sol";
import "@openzeppelin/contracts/access/AccessControlEnumerable.sol";
import "@openzeppelin/contracts/utils/Context.sol";
import "@openzeppelin/contracts/utils/Strings.sol"; 


/**
 * @dev {ERC1155} token, including:
 *
 *  - ability for holders to burn (destroy) their tokens
 *  - a minter role that allows for token minting (creation)
 *  - a pauser role that allows to stop all token transfers
 *
 * This contract uses {AccessControl} to lock permissioned functions using the
 * different roles - head to its documentation for details.
 *
 * The account that deploys the contract will be granted the minter and pauser
 * roles, as well as the default admin role, which will let it grant both minter
 * and pauser roles to other accounts.
 *
 * _Deprecated in favor of https://wizard.openzeppelin.com/[Contracts Wizard]._
 */
contract HexDoge is Context, AccessControlEnumerable, ERC1155Burnable, ERC1155Pausable, ERC1155Holder {
    struct Metadata{
      string status;
      string category;
      uint256 DuplicateDuration;
      uint256 DuplicateSuccessRate;
      uint256 DuplicateEnergyEarn;
      uint256 DuplicateDoneDate;
      uint256 FixingEnergyCost;
    }

    mapping(uint256 => Metadata) public metadata;
    uint256 public now_ = block.timestamp;
    string public name = "HexDoge";

    uint256 public constant MINT_PRICE = 1;
    uint256 public constant MAX_TOKEN_ID = 36;

    bytes32 public constant MINTER_ROLE = keccak256("MINTER_ROLE");
    bytes32 public constant PAUSER_ROLE = keccak256("PAUSER_ROLE");

    /**
     * @dev Grants `DEFAULT_ADMIN_ROLE`, `MINTER_ROLE`, and `PAUSER_ROLE` to the account that
     * deploys the contract.
     */
    constructor() ERC1155("ipfs://QmR85eoYDZrmNK4Ju8tBsYx9fYo9LjpTpzZioFRpsSyo3k/") {
        _setupRole(DEFAULT_ADMIN_ROLE, _msgSender());

        _setupRole(MINTER_ROLE, _msgSender());
        _setupRole(PAUSER_ROLE, _msgSender());


          metadata[1] = Metadata({
            status: 'liveness',
            category: 'genesis',
            DuplicateDuration: 31,
            DuplicateSuccessRate: 46,
            DuplicateEnergyEarn: 2,
            DuplicateDoneDate: 0,
            FixingEnergyCost: 24
          });
    

          metadata[2] = Metadata({
            status: 'liveness',
            category: 'genesis',
            DuplicateDuration: 54,
            DuplicateSuccessRate: 54,
            DuplicateEnergyEarn: 6,
            DuplicateDoneDate: 0,
            FixingEnergyCost: 1
          });
    

          metadata[3] = Metadata({
            status: 'liveness',
            category: 'genesis',
            DuplicateDuration: 21,
            DuplicateSuccessRate: 45,
            DuplicateEnergyEarn: 6,
            DuplicateDoneDate: 0,
            FixingEnergyCost: 15
          });
    

          metadata[4] = Metadata({
            status: 'liveness',
            category: 'genesis',
            DuplicateDuration: 30,
            DuplicateSuccessRate: 47,
            DuplicateEnergyEarn: 9,
            DuplicateDoneDate: 0,
            FixingEnergyCost: 9
          });
    

          metadata[5] = Metadata({
            status: 'liveness',
            category: 'genesis',
            DuplicateDuration: 42,
            DuplicateSuccessRate: 43,
            DuplicateEnergyEarn: 22,
            DuplicateDoneDate: 0,
            FixingEnergyCost: 25
          });
    

          metadata[6] = Metadata({
            status: 'liveness',
            category: 'genesis',
            DuplicateDuration: 35,
            DuplicateSuccessRate: 57,
            DuplicateEnergyEarn: 4,
            DuplicateDoneDate: 0,
            FixingEnergyCost: 10
          });
    

          metadata[7] = Metadata({
            status: 'liveness',
            category: 'genesis',
            DuplicateDuration: 57,
            DuplicateSuccessRate: 53,
            DuplicateEnergyEarn: 14,
            DuplicateDoneDate: 0,
            FixingEnergyCost: 16
          });
    

          metadata[8] = Metadata({
            status: 'liveness',
            category: 'genesis',
            DuplicateDuration: 42,
            DuplicateSuccessRate: 49,
            DuplicateEnergyEarn: 14,
            DuplicateDoneDate: 0,
            FixingEnergyCost: 21
          });
    

          metadata[9] = Metadata({
            status: 'liveness',
            category: 'genesis',
            DuplicateDuration: 31,
            DuplicateSuccessRate: 58,
            DuplicateEnergyEarn: 25,
            DuplicateDoneDate: 0,
            FixingEnergyCost: 25
          });
    

          metadata[10] = Metadata({
            status: 'liveness',
            category: 'genesis',
            DuplicateDuration: 28,
            DuplicateSuccessRate: 40,
            DuplicateEnergyEarn: 15,
            DuplicateDoneDate: 0,
            FixingEnergyCost: 22
          });
    

          metadata[11] = Metadata({
            status: 'liveness',
            category: 'genesis',
            DuplicateDuration: 31,
            DuplicateSuccessRate: 22,
            DuplicateEnergyEarn: 20,
            DuplicateDoneDate: 0,
            FixingEnergyCost: 28
          });
    

          metadata[12] = Metadata({
            status: 'liveness',
            category: 'genesis',
            DuplicateDuration: 42,
            DuplicateSuccessRate: 28,
            DuplicateEnergyEarn: 29,
            DuplicateDoneDate: 0,
            FixingEnergyCost: 1
          });
    

          metadata[13] = Metadata({
            status: 'liveness',
            category: 'genesis',
            DuplicateDuration: 30,
            DuplicateSuccessRate: 54,
            DuplicateEnergyEarn: 4,
            DuplicateDoneDate: 0,
            FixingEnergyCost: 20
          });
    

          metadata[14] = Metadata({
            status: 'liveness',
            category: 'genesis',
            DuplicateDuration: 53,
            DuplicateSuccessRate: 40,
            DuplicateEnergyEarn: 18,
            DuplicateDoneDate: 0,
            FixingEnergyCost: 30
          });
    

          metadata[15] = Metadata({
            status: 'liveness',
            category: 'genesis',
            DuplicateDuration: 43,
            DuplicateSuccessRate: 38,
            DuplicateEnergyEarn: 19,
            DuplicateDoneDate: 0,
            FixingEnergyCost: 19
          });
    

          metadata[16] = Metadata({
            status: 'liveness',
            category: 'genesis',
            DuplicateDuration: 31,
            DuplicateSuccessRate: 41,
            DuplicateEnergyEarn: 16,
            DuplicateDoneDate: 0,
            FixingEnergyCost: 5
          });
    

          metadata[17] = Metadata({
            status: 'liveness',
            category: 'genesis',
            DuplicateDuration: 35,
            DuplicateSuccessRate: 14,
            DuplicateEnergyEarn: 4,
            DuplicateDoneDate: 0,
            FixingEnergyCost: 7
          });
    

          metadata[18] = Metadata({
            status: 'liveness',
            category: 'genesis',
            DuplicateDuration: 38,
            DuplicateSuccessRate: 46,
            DuplicateEnergyEarn: 29,
            DuplicateDoneDate: 0,
            FixingEnergyCost: 10
          });
    

          metadata[19] = Metadata({
            status: 'liveness',
            category: 'genesis',
            DuplicateDuration: 46,
            DuplicateSuccessRate: 45,
            DuplicateEnergyEarn: 21,
            DuplicateDoneDate: 0,
            FixingEnergyCost: 8
          });
    

          metadata[20] = Metadata({
            status: 'liveness',
            category: 'genesis',
            DuplicateDuration: 27,
            DuplicateSuccessRate: 31,
            DuplicateEnergyEarn: 14,
            DuplicateDoneDate: 0,
            FixingEnergyCost: 10
          });
    

          metadata[21] = Metadata({
            status: 'liveness',
            category: 'genesis',
            DuplicateDuration: 56,
            DuplicateSuccessRate: 31,
            DuplicateEnergyEarn: 2,
            DuplicateDoneDate: 0,
            FixingEnergyCost: 4
          });
    

          metadata[22] = Metadata({
            status: 'liveness',
            category: 'genesis',
            DuplicateDuration: 42,
            DuplicateSuccessRate: 46,
            DuplicateEnergyEarn: 21,
            DuplicateDoneDate: 0,
            FixingEnergyCost: 2
          });
    

          metadata[23] = Metadata({
            status: 'liveness',
            category: 'genesis',
            DuplicateDuration: 24,
            DuplicateSuccessRate: 60,
            DuplicateEnergyEarn: 25,
            DuplicateDoneDate: 0,
            FixingEnergyCost: 12
          });
    

          metadata[24] = Metadata({
            status: 'liveness',
            category: 'genesis',
            DuplicateDuration: 45,
            DuplicateSuccessRate: 43,
            DuplicateEnergyEarn: 9,
            DuplicateDoneDate: 0,
            FixingEnergyCost: 10
          });
    

          metadata[25] = Metadata({
            status: 'liveness',
            category: 'genesis',
            DuplicateDuration: 52,
            DuplicateSuccessRate: 25,
            DuplicateEnergyEarn: 5,
            DuplicateDoneDate: 0,
            FixingEnergyCost: 14
          });
    

          metadata[26] = Metadata({
            status: 'liveness',
            category: 'genesis',
            DuplicateDuration: 51,
            DuplicateSuccessRate: 55,
            DuplicateEnergyEarn: 18,
            DuplicateDoneDate: 0,
            FixingEnergyCost: 14
          });
    

          metadata[27] = Metadata({
            status: 'liveness',
            category: 'genesis',
            DuplicateDuration: 26,
            DuplicateSuccessRate: 11,
            DuplicateEnergyEarn: 22,
            DuplicateDoneDate: 0,
            FixingEnergyCost: 2
          });
    

          metadata[28] = Metadata({
            status: 'liveness',
            category: 'genesis',
            DuplicateDuration: 25,
            DuplicateSuccessRate: 34,
            DuplicateEnergyEarn: 21,
            DuplicateDoneDate: 0,
            FixingEnergyCost: 29
          });
    

          metadata[29] = Metadata({
            status: 'liveness',
            category: 'genesis',
            DuplicateDuration: 28,
            DuplicateSuccessRate: 24,
            DuplicateEnergyEarn: 3,
            DuplicateDoneDate: 0,
            FixingEnergyCost: 12
          });
    

          metadata[30] = Metadata({
            status: 'liveness',
            category: 'genesis',
            DuplicateDuration: 37,
            DuplicateSuccessRate: 43,
            DuplicateEnergyEarn: 19,
            DuplicateDoneDate: 0,
            FixingEnergyCost: 4
          });
    

          metadata[31] = Metadata({
            status: 'liveness',
            category: 'genesis',
            DuplicateDuration: 40,
            DuplicateSuccessRate: 52,
            DuplicateEnergyEarn: 3,
            DuplicateDoneDate: 0,
            FixingEnergyCost: 28
          });
    

          metadata[32] = Metadata({
            status: 'liveness',
            category: 'genesis',
            DuplicateDuration: 59,
            DuplicateSuccessRate: 56,
            DuplicateEnergyEarn: 28,
            DuplicateDoneDate: 0,
            FixingEnergyCost: 16
          });
    

          metadata[33] = Metadata({
            status: 'liveness',
            category: 'genesis',
            DuplicateDuration: 59,
            DuplicateSuccessRate: 34,
            DuplicateEnergyEarn: 11,
            DuplicateDoneDate: 0,
            FixingEnergyCost: 7
          });
    

          metadata[34] = Metadata({
            status: 'liveness',
            category: 'genesis',
            DuplicateDuration: 36,
            DuplicateSuccessRate: 56,
            DuplicateEnergyEarn: 29,
            DuplicateDoneDate: 0,
            FixingEnergyCost: 21
          });
    

          metadata[35] = Metadata({
            status: 'liveness',
            category: 'genesis',
            DuplicateDuration: 21,
            DuplicateSuccessRate: 37,
            DuplicateEnergyEarn: 9,
            DuplicateDoneDate: 0,
            FixingEnergyCost: 20
          });
    

          metadata[36] = Metadata({
            status: 'liveness',
            category: 'genesis',
            DuplicateDuration: 20,
            DuplicateSuccessRate: 58,
            DuplicateEnergyEarn: 26,
            DuplicateDoneDate: 0,
            FixingEnergyCost: 29
          });
    
    }

    /**
     * @dev Creates `amount` new tokens for `to`, of token type `id`.
     *
     * See {ERC1155-_mint}.
     *
     * Requirements:
     *
     * - the caller must have the `MINTER_ROLE`.
     */
    function mint(
        address to,
        uint256 amount
    ) public payable {
        // require(hasRole(MINTER_ROLE, _msgSender()), "ERC1155PresetMinterPauser: must have minter role to mint");
        require(msg.value == MINT_PRICE * amount, "not enough ETH");

        uint256 randomNumber = uint256(blockhash(block.number - 1));
        uint256 mintTokenId = randomNumber % MAX_TOKEN_ID + 1;
        _mint(to, mintTokenId, amount, "");
    }

    /**
     * @dev xref:ROOT:erc1155.adoc#batch-operations[Batched] variant of {mint}.
     */
    //function mintBatch(
        //address to,
        //uint256[] memory ids,
        //uint256[] memory amounts,
        //bytes memory data
    //) public virtual {
        //// require(hasRole(MINTER_ROLE, _msgSender()), "ERC1155PresetMinterPauser: must have minter role to mint");

        //_mintBatch(to, ids, amounts, data);
    //}

    function duplicate (uint256 id) public {
      safeTransferFrom(_msgSender(), address(this), id, 1, "");
    }


    function uri(uint256 tokenId) override public view 
    returns (string memory) { 
        return string(abi.encodePacked(super.uri(tokenId), Strings.toString(tokenId), '.json'));
    } 

    /**
     * @dev Pauses all token transfers.
     *
     * See {ERC1155Pausable} and {Pausable-_pause}.
     *
     * Requirements:
     *
     * - the caller must have the `PAUSER_ROLE`.
     */
    function pause() public virtual {
        require(hasRole(PAUSER_ROLE, _msgSender()), "ERC1155PresetMinterPauser: must have pauser role to pause");
        _pause();
    }

    /**
     * @dev Unpauses all token transfers.
     *
     * See {ERC1155Pausable} and {Pausable-_unpause}.
     *
     * Requirements:
     *
     * - the caller must have the `PAUSER_ROLE`.
     */
    function unpause() public virtual {
        require(hasRole(PAUSER_ROLE, _msgSender()), "ERC1155PresetMinterPauser: must have pauser role to unpause");
        _unpause();
    }

    /**
     * @dev See {IERC165-supportsInterface}.
     */
    function supportsInterface(bytes4 interfaceId)
        public
        view
        virtual
        override(AccessControlEnumerable, ERC1155, ERC1155Receiver)
        returns (bool)
    {
        return super.supportsInterface(interfaceId);
    }

    function _beforeTokenTransfer(
        address operator,
        address from,
        address to,
        uint256[] memory ids,
        uint256[] memory amounts,
        bytes memory data
    ) internal virtual override(ERC1155, ERC1155Pausable) {
        super._beforeTokenTransfer(operator, from, to, ids, amounts, data);
    }
}
