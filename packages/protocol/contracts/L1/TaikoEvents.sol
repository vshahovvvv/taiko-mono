// SPDX-License-Identifier: MIT
//  _____     _ _         _         _
// |_   _|_ _(_) |_____  | |   __ _| |__ ___
//   | |/ _` | | / / _ \ | |__/ _` | '_ (_-<
//   |_|\__,_|_|_\_\___/ |____\__,_|_.__/__/
//
//   Email: security@taiko.xyz
//   Website: https://taiko.xyz
//   GitHub: https://github.com/taikoxyz
//   Discord: https://discord.gg/taikoxyz
//   Twitter: https://twitter.com/taikoxyz
//   Blog: https://mirror.xyz/labs.taiko.eth
//   Youtube: https://www.youtube.com/@taikoxyz

pragma solidity 0.8.24;

import "./TaikoData.sol";

/// @title TaikoEvents
/// @custom:security-contact security@taiko.xyz
/// @notice This abstract contract provides event declarations for the Taiko
/// protocol, which are emitted during block proposal, proof, verification, and
/// Ethereum deposit processes.
/// @dev The events defined here must match the definitions in the corresponding
/// L1 libraries.
abstract contract TaikoEvents {
    /// @dev Emitted when a block is proposed.
    /// @param blockId The ID of the proposed block.
    /// @param assignedProver The block's assigned prover.
    /// @param livenessBond The bond in Taiko token from the assigned prover.
    /// @param meta The block metadata containing information about the proposed
    /// block.
    /// @param depositsProcessed Ether deposits processed.
    event BlockProposed(
        uint256 indexed blockId,
        address indexed assignedProver,
        uint96 livenessBond,
        TaikoData.BlockMetadata meta,
        TaikoData.EthDeposit[] depositsProcessed
    );
    /// @dev Emitted when a block is verified.
    /// @param blockId The ID of the verified block.
    /// @param assignedProver The block's assigned prover.
    /// @param prover The prover whose transition is used for verifing the
    /// block.
    /// @param blockHash The hash of the verified block.
    /// @param stateRoot The block's state root.
    /// @param tier The tier ID of the proof.
    /// @param contestations Number of total contestations.
    event BlockVerified(
        uint256 indexed blockId,
        address indexed assignedProver,
        address indexed prover,
        bytes32 blockHash,
        bytes32 stateRoot,
        uint16 tier,
        uint8 contestations
    );

    /// @dev Emitted when a block transition is proved or re-proved.
    /// @param blockId The ID of the proven block.
    /// @param tran The verified transition.
    /// @param prover The prover address.
    /// @param validityBond The validity bond amount.
    /// @param tier The tier ID of the proof.
    event TransitionProved(
        uint256 indexed blockId,
        TaikoData.Transition tran,
        address prover,
        uint96 validityBond,
        uint16 tier
    );

    /// @dev Emitted when a block transition is contested.
    /// @param blockId The ID of the proven block.
    /// @param tran The verified transition.
    /// @param contester The contester address.
    /// @param contestBond The contesting bond amount.
    /// @param tier The tier ID of the proof.
    event TransitionContested(
        uint256 indexed blockId,
        TaikoData.Transition tran,
        address contester,
        uint96 contestBond,
        uint16 tier
    );

    /// @dev Emitted when a blob is cached for reuse.
    /// @param blobHash The blobHash cached.
    event BlobCached(bytes32 blobHash);

    /// @dev Emitted when proving has been paused
    /// @param paused True if paused, false if unpaused.
    event ProvingPaused(bool paused);

    /// @dev Emitted when an Ethereum deposit is made.
    /// @param deposit The Ethereum deposit information including recipient,
    /// amount, and ID.
    event EthDeposited(TaikoData.EthDeposit deposit);
}
