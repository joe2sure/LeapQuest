import 'package:flame/events.dart';
import 'package:flutter/material.dart';

class MinimalGame extends FlameGame with TapDetector {
  late Player player;
  List<Platform> platforms = [];
  List<PowerUp> powerUps = [];
  double score = 0;
  bool isGameOver = false;
  final DifficultyManager difficultyManager = DifficultyManager();

  @override
  void update(double dt) {
    super.update(dt);
    
    if (!isGameOver) {
      _updateScore(dt);
      _managePlatforms();
      _managePowerUps();
      _checkGameOver();
    }
  }

  void _updateScore(double dt) {
    if (player.position.y < size.y / 2) {
      score += (-player.velocity.y * dt * 0.1);
      difficultyManager.updateDifficulty(score);
    }
  }

  void _managePowerUps() {
    if (Random().nextDouble() < difficultyManager.powerUpChance) {
      _spawnPowerUp();
    }
  }

  void _spawnPowerUp() {
    final powerUpType = PowerUpType.values[
      Random().nextInt(PowerUpType.values.length)
    ];
    
    final powerUp = PowerUp(
      type: powerUpType,
      position: Vector2(
        Random().nextDouble() * size.x,
        -50,
      ),
    );
    
    powerUps.add(powerUp);
    add(powerUp);
  }
}