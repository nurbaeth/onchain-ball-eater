// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

contract BallEater {
    struct Ball {
        uint256 radius;
        bool exists;
    }

    mapping(address => Ball) public balls;

    event BallCreated(address indexed player, uint256 radius);
    event BallEaten(address indexed eater, address indexed victim, uint256 newRadius);

    /// Create a new ball with a given radius (e.g. 1-100)
    function createBall(uint256 radius) external {
        require(!balls[msg.sender].exists, "You already have a ball");
        require(radius > 0 && radius <= 100, "Radius must be between 1 and 100");

        balls[msg.sender] = Ball(radius, true);
        emit BallCreated(msg.sender, radius);
    }

    /// Try to eat another player's ball
    function eatBall(address victim) external {
        require(msg.sender != victim, "Cannot eat yourself");
        require(balls[msg.sender].exists, "You don't have a ball");
        require(balls[victim].exists, "Victim has no ball");

        Ball storage eater = balls[msg.sender];
        Ball storage target = balls[victim];

        require(eater.radius > target.radius, "You can only eat smaller balls");

        // Absorb the radius
        eater.radius += target.radius;
        delete balls[victim];

        emit BallEaten(msg.sender, victim, eater.radius);
    }

    /// View your current radius
    function getMyRadius() external view returns (uint256) {
        require(balls[msg.sender].exists, "You don't have a ball");
        return balls[msg.sender].radius;
    }
}
