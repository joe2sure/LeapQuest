import 'package:flame/components.dart';
import 'package:leap_quest/config/config.dart';

class DifficultyManager extends Component{
  double _difficultyMultiplier = 1.0;
  double _platformGap = GameConfig.initialPlatformGap;
  double _powerUpChance = GameConfig.powerUpSpawnChance;
  double _moveSpeed = GameConfig.moveSpeed;
  double _enemySpawnChance = 0.03; // Initial enemy spawn chance

  double get difficultyMultiplier => _difficultyMultiplier;
  double get platformGap => _platformGap;
  double get powerUpChance => _powerUpChance;
  double get moveSpeed => _moveSpeed;
  double get enemySpawnChance => _enemySpawnChance;

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

    // Adjust enemy spawn chance based on difficulty
    _enemySpawnChance = 0.03 * _difficultyMultiplier;
    _enemySpawnChance = _enemySpawnChance.clamp(0.03, 0.15); // Limit maximum spawn chance
  }

  /// Resets the difficulty to its initial state.
  void reset() {
    _difficultyMultiplier = 1.0;
    _platformGap = GameConfig.initialPlatformGap;
    _powerUpChance = GameConfig.powerUpSpawnChance;
    _moveSpeed = GameConfig.moveSpeed;
    _enemySpawnChance = 0.03;
  }

 @override
  void update(double dt) {
    super.update(dt);
    // Add any time-based difficulty scaling here if needed
  }
}