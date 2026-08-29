// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract QDXORewards {
    address public owner;
    mapping(address => uint256) public balances;

    event RewardSent(address indexed to, uint256 amount);

    constructor() {
        owner = msg.sender;
    }

    // función para enviar recompensas
    function sendReward(address to, uint256 amount) public {
        require(msg.sender == owner, "Solo el owner puede enviar recompensas");
        balances[to] += amount;
        emit RewardSent(to, amount);
    }

    // consultar balance de un nodo
    function getBalance(address account) public view returns (uint256) {
        return balances[account];
    }
}
