

import 'package:leap_quest/config/config.dart';

class DifficultyManager {
  double _difficultyMultiplier = 1.0;
  double _platformGap = GameConfig.initialPlatformGap;
  double _powerUpChance = GameConfig.powerUpSpawnChance;
  double _moveSpeed = GameConfig.moveSpeed;

  double get difficultyMultiplier => _difficultyMultiplier;
  double get platformGap => _platformGap;
  double get powerUpChance => _powerUpChance;
  double get moveSpeed => _moveSpeed;

  /// Updates the difficulty based on the player's score.
  void updateDifficulty(double score) {
    // Calculate the difficulty multiplier based on the score
    _difficultyMultiplier = 1.0 + (score / GameConfig.difficultyIncrementScore) * GameConfig.maxDifficultyMultiplier;
    _difficultyMultiplier = _difficultyMultiplier.clamp(1.0, GameConfig.maxDifficultyMultiplier);

    // Adjust platform gap based on difficulty
    _platformGap = GameConfig.initialPlatformGap / _difficultyMultiplier;
    _platformGap = _platformGap.clamp(GameConfig.minPlatformGap, GameConfig.maxPlatformGap);

    // Adjust power-up spawn chance based on difficulty
    _powerUpChance = GameConfig.powerUpSpawnChance * _difficultyMultiplier;

    // Adjust movement speed based on difficulty
    _moveSpeed = GameConfig.moveSpeed * _difficultyMultiplier;
  }

  /// Resets the difficulty to its initial state.
  void reset() {
    _difficultyMultiplier = 1.0;
    _platformGap = GameConfig.initialPlatformGap;
    _powerUpChance = GameConfig.powerUpSpawnChance;
    _moveSpeed = GameConfig.moveSpeed;
  }
}