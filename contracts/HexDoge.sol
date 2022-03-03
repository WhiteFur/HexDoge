// SPDX-License-Identifier: MIT
// OpenZeppelin Contracts (last updated v4.5.0) (token/ERC1155/presets/ERC1155PresetMinterPauser.sol)

pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC1155/ERC1155.sol";
import "@openzeppelin/contracts/token/ERC1155/extensions/ERC1155Burnable.sol";
import "@openzeppelin/contracts/token/ERC1155/extensions/ERC1155Pausable.sol";
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
contract HexDoge is Context, AccessControlEnumerable, ERC1155Burnable, ERC1155Pausable {
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

    uint256 public constant MINT_PRICE = 0;
    uint256 public constant MAX_TOKEN_ID = 36;

    bytes32 public constant MINTER_ROLE = keccak256("MINTER_ROLE");
    bytes32 public constant PAUSER_ROLE = keccak256("PAUSER_ROLE");
    uint256 public CURRENT_GENESIS_ID = 0;
    uint256 public CURRENT_NORMAL_ID = 1000;
    uint256 constant MIN_HEX_GENESIS_ID = 1;
    uint256 constant MAX_HEX_GENESIS_ID = 36;
    uint256 constant MIN_HEX_NORMAL_ID = 1000;
    uint256 constant MAX_HEX_NORMAL_ID = 9000;
    uint256 constant ENERGY_TOKEN_ID = 9999;
    uint256 constant ENERGY_TOKEN_MAX_SUPPLY = 1000000000;

    mapping(uint256 => address) public token2ownerMap;

    /**
     * @dev Grants `DEFAULT_ADMIN_ROLE`, `MINTER_ROLE`, and `PAUSER_ROLE` to the account that
     * deploys the contract.
     */
    constructor() ERC1155("ipfs://QmR85eoYDZrmNK4Ju8tBsYx9fYo9LjpTpzZioFRpsSyo3k/") {
        _setupRole(DEFAULT_ADMIN_ROLE, _msgSender());

        _setupRole(MINTER_ROLE, _msgSender());
        _setupRole(PAUSER_ROLE, _msgSender());
        _mint(msg.sender, ENERGY_TOKEN_ID, ENERGY_TOKEN_MAX_SUPPLY, "");
    }

    function generateGenesisHex(uint256 tokenId, uint256 randomNumber) private returns (Metadata storage) {
        require(tokenId >= MIN_HEX_GENESIS_ID);
        require(tokenId <= MAX_HEX_GENESIS_ID);

        metadata[tokenId] = Metadata({
            status: 'liveness',
            category: 'genesis',
            DuplicateDuration: randomNumber % 100,
            DuplicateSuccessRate: (randomNumber + 50) % 100,
            DuplicateEnergyEarn: randomNumber * 1000,
            DuplicateDoneDate: 0,
            FixingEnergyCost: randomNumber * 100
        });

        return metadata[tokenId];
    }

    function generateNormalHex(uint256 tokenId, uint256 randomNumber) private returns (Metadata storage) {
        require(tokenId >= MIN_HEX_NORMAL_ID);
        require(tokenId <= MAX_HEX_NORMAL_ID);

        metadata[tokenId] = Metadata({
            status: 'liveness',
            category: 'normal',
            DuplicateDuration: randomNumber % 100,
            DuplicateSuccessRate: (randomNumber + 50) % 100,
            DuplicateEnergyEarn: randomNumber * 1000,
            DuplicateDoneDate: 0,
            FixingEnergyCost: randomNumber * 100
        });

        return metadata[tokenId];
    }

    function getHexMetadata(uint256 tokenId) public view 
    returns (string memory, uint256, uint256, uint256, uint256, uint256) {
        return ( 
            metadata[tokenId].status,
        //  metadata[tokenId].category,
            metadata[tokenId].DuplicateDuration,
            metadata[tokenId].DuplicateSuccessRate,
            metadata[tokenId].DuplicateEnergyEarn,
            metadata[tokenId].DuplicateDoneDate,
            metadata[tokenId].FixingEnergyCost
        );
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
    ) public payable returns (uint256[] memory) {
        // require(hasRole(MINTER_ROLE, _msgSender()), "ERC1155PresetMinterPauser: must have minter role to mint");
        require(CURRENT_GENESIS_ID + amount < MAX_HEX_GENESIS_ID);
        require(msg.value == MINT_PRICE * amount, "not enough ETH");
        uint256[] memory ids = new uint256[](amount);
        

        // ownerList[to][0] = 1;
        // uint256 currentIndex = ownerList[to].length;

        uint256 randomNumber = uint256(blockhash(block.number - 1));
        for(uint16 i = 0; i < amount; i++) {
            CURRENT_GENESIS_ID += 1;
            _mint(to, CURRENT_GENESIS_ID, 1, "");
            generateGenesisHex(CURRENT_GENESIS_ID, randomNumber);
            token2ownerMap[CURRENT_GENESIS_ID] = msg.sender;
            ids[i] = CURRENT_GENESIS_ID;
        }

        return ids;
    }

    function doDuplicate(uint16 tokenId) public returns(uint256) {
        require(balanceOf(msg.sender, tokenId) != 0, "you are not owner");
        require(keccak256(abi.encodePacked((metadata[tokenId].category))) == keccak256(abi.encodePacked(('genesis'))), "HEX category need to be GENESIS");
        require(keccak256(abi.encodePacked((metadata[tokenId].status))) == keccak256(abi.encodePacked(('liveness'))), "HEX status need to be liveness");

        metadata[tokenId].status = 'duplicating';
        metadata[tokenId].DuplicateDoneDate = block.timestamp + metadata[tokenId].DuplicateDuration;
        
        return metadata[tokenId].DuplicateDoneDate;
    }

    function doClaimAll(uint16 tokenId) public returns(string memory) {
        require(balanceOf(msg.sender, tokenId) != 0, "you are not owner");
        require(keccak256(abi.encodePacked((metadata[tokenId].status))) == keccak256(abi.encodePacked(('duplicating'))), "HEX status need to be liveness");
        require(metadata[tokenId].DuplicateDoneDate <= block.timestamp, "still in duplicating");


        metadata[tokenId].status = 'duplicating';
        metadata[tokenId].DuplicateDoneDate = block.timestamp + metadata[tokenId].DuplicateDuration;

        uint256 randomNumber = uint256(blockhash(block.number - 1)) % 100;
        if (metadata[tokenId].DuplicateSuccessRate < randomNumber) {
            metadata[tokenId].status = 'liveness';
            _mint(msg.sender, ENERGY_TOKEN_ID, metadata[tokenId].DuplicateEnergyEarn, "");
            CURRENT_NORMAL_ID += 1;
            _mint(msg.sender, CURRENT_NORMAL_ID, 1, "");
             
        } else {
            metadata[tokenId].status = 'broken';
        }
        metadata[tokenId].DuplicateDoneDate = 0;
        
        return metadata[tokenId].status;
    }

    function doFixing(uint16 tokenId) public returns(uint256) {
        require(balanceOf(msg.sender, tokenId) != 0, "you are not owner");
        require(balanceOf(msg.sender, ENERGY_TOKEN_ID) >= metadata[tokenId].FixingEnergyCost, "insufficient ENERGY TOKEN");
        require(keccak256(abi.encodePacked((metadata[tokenId].category))) == keccak256(abi.encodePacked(('genesis'))), "HEX category need to be GENESIS");
        require(keccak256(abi.encodePacked((metadata[tokenId].status))) == keccak256(abi.encodePacked(('broken'))), "HEX status need to be broken");

        safeTransferFrom(msg.sender, address(this), ENERGY_TOKEN_ID, metadata[tokenId].FixingEnergyCost, "");
        metadata[tokenId].status = 'liveness';
        
        return balanceOf(msg.sender, ENERGY_TOKEN_ID);
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
        override(AccessControlEnumerable, ERC1155)
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
