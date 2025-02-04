class GameConfig {
  static const Map<String, double> difficultySettings = {
    'Easy': 1.0,
    'Normal': 1.5,
    'Hard': 2.0,
    'Legendary': 3.0,
  };

 static const double jumpStrength = 300.0;
static const double initialEnemySpawnChance = 0.03;
static const double maxEnemySpawnChance = 0.15;

  // Game physics
  static const double gravity = 0.5;
  static const double jumpForce = -15.0;
  static const double maxFallSpeed = 20.0;
  static const double moveSpeed = 5.0;
  
  // Game dimensions
  static const double playerSize = 30.0;
  static const double platformWidth = 60.0;
  static const double platformHeight = 10.0;
  static const double powerUpSize = 20.0;
  
  // Game mechanics
  static const double initialPlatformGap = 150.0;
  static const double minPlatformGap = 100.0;
  static const double maxPlatformGap = 200.0;
  static const int platformPoolSize = 20;
  static const double powerUpSpawnChance = 0.05;
  
  // Power-up durations (seconds)
  static const double shieldDuration = 5.0;
  static const double jumpBoostDuration = 3.0;
  static const double magnetDuration = 4.0;
  
  // Score multipliers
  static const double baseScoreMultiplier = 1.0;
  static const double heightScoreMultiplier = 0.1;
  static const double powerUpScoreBonus = 50.0;
  
  // Difficulty scaling
  static const double difficultyIncrementScore = 1000.0;
  static const double maxDifficultyMultiplier = 2.0;
  
  // Achievement thresholds
  static const int bronzeScoreThreshold = 1000;
  static const int silverScoreThreshold = 5000;
  static const int goldScoreThreshold = 10000;
}