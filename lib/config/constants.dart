class GameConstants {
  // Asset paths
  static const String audioPath = 'assets/audio/';
  static const String jumpSound = '${audioPath}jump.mp3';
  static const String powerUpSound = '${audioPath}powerup.mp3';
  static const String gameOverSound = '${audioPath}gameover.mp3';
  
  // Storage keys
  static const String highScoreKey = 'highScore';
  static const String unlockedColorsKey = 'unlockedColors';
  static const String achievementsKey = 'achievements';
  static const String settingsKey = 'settings';
  
  // Achievement IDs
  static const String achievementBronze = 'score_1000';
  static const String achievementSilver = 'score_5000';
  static const String achievementGold = 'score_10000';
  static const String achievementJumps = 'jumps_100';
  static const String achievementPowerUps = 'powerups_10';
  
  // Game states
  static const String stateMenu = 'menu';
  static const String stateGame = 'game';
  static const String statePause = 'pause';
  static const String stateGameOver = 'gameOver';
  
  // UI text
  static const String gameTitle = 'Leap Quest';
  static const String playButtonText = 'PLAY';
  static const String settingsButtonText = 'SETTINGS';
  static const String resumeButtonText = 'RESUME';
  static const String restartButtonText = 'RESTART';
  static const String quitButtonText = 'QUIT';
  static const String scoreText = 'Score: ';
  static const String highScoreText = 'High Score: ';
  
  // Error messages
  static const String errorLoadingAssets = 'Error loading game assets';
  static const String errorSavingData = 'Error saving game data';
  static const String errorLoadingData = 'Error loading game data';
}