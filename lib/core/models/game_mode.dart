enum GameMode {
  normal,
  speed,
  zen;

  String get displayName {
    switch (this) {
      case GameMode.normal:
        return 'Normal';
      case GameMode.speed:
        return 'Speed Run';
      case GameMode.zen:
        return 'Zen Mode';
    }
  }

  String get description {
    switch (this) {
      case GameMode.normal:
        return 'Classic gameplay with balanced difficulty';
      case GameMode.speed:
        return 'Faster gameplay with increased difficulty';
      case GameMode.zen:
        return 'Relaxed gameplay without game over';
    }
  }

  double get speedMultiplier {
    switch (this) {
      case GameMode.normal:
        return 1.0;
      case GameMode.speed:
        return 1.5;
      case GameMode.zen:
        return 0.8;
    }
  }

  double get scoreMultiplier {
    switch (this) {
      case GameMode.normal:
        return 1.0;
      case GameMode.speed:
        return 1.5;
      case GameMode.zen:
        return 0.5;
    }
  }

  bool get hasGameOver {
    return this != GameMode.zen;
  }
}

class GameModeConfig {
  final GameMode mode;
  final double gravity;
  final double jumpForce;
  final double platformGap;
  final double powerUpFrequency;

  GameModeConfig({
    required this.mode,
    required this.gravity,
    required this.jumpForce,
    required this.platformGap,
    required this.powerUpFrequency,
  });

  factory GameModeConfig.fromMode(GameMode mode) {
    switch (mode) {
      case GameMode.normal:
        return GameModeConfig(
          mode: mode,
          gravity: 0.5,
          jumpForce: -15.0,
          platformGap: 150.0,
          powerUpFrequency: 0.05,
        );
      case GameMode.speed:
        return GameModeConfig(
          mode: mode,
          gravity: 0.7,
          jumpForce: -18.0,
          platformGap: 180.0,
          powerUpFrequency: 0.08,
        );
      case GameMode.zen:
        return GameModeConfig(
          mode: mode,
          gravity: 0.4,
          jumpForce: -13.0,
          platformGap: 120.0,
          powerUpFrequency: 0.1,
        );
    }
  }
}