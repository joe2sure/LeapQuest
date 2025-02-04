import 'package:flutter/material.dart';
import 'package:leap_quest/config/config.dart';
import 'package:leap_quest/core/models/player_data.dart';
import 'package:leap_quest/core/services/acheivement_service.dart';
import 'package:leap_quest/core/services/storage_service.dart';
import 'package:leap_quest/game/components/player.dart';

class GameManager extends ChangeNotifier {
  double _score = 0.0;
  bool _isGameOver = false;
  final PlayerData _playerData = PlayerData.defaultData();
  final AchievementService _achievementService = AchievementService();
  final StorageService _storageService = StorageService();

  double get score => _score;
  bool get isGameOver => _isGameOver;
  PlayerData get playerData => _playerData;

  /// Updates the game state, including score and achievements.
  void update(double dt, Player player) {
    if (!_isGameOver) {
      // Update score based on player height
      _score += (-player.velocity.y * dt * GameConfig.heightScoreMultiplier);

      // Check for achievements
      _achievementService.checkAchievements(
        _score.toInt(),
        _playerData.totalJumps,
        _playerData.powerUpsCollected,
      );

      // Save high score if applicable
      if (_score > _playerData.highScore) {
        _playerData.updateHighScore(_score.toInt(), 'normal'); // Assuming normal mode for now
        _storageService.saveHighScore(_score.toInt());
      }
    }
    notifyListeners(); // Notify listeners when the state changes
  }

  /// Handles game over logic.
  void gameOver() {
    _isGameOver = true;
    // Save player data
    _storageService.saveUnlockedColors(_playerData.unlockedColors);
    notifyListeners(); // Notify listeners when the state changes
  }

  /// Resets the game state for a new game.
  void reset() {
    _score = 0.0;
    _isGameOver = false;
    _playerData.totalJumps = 0;
    _playerData.powerUpsCollected = 0;
    notifyListeners(); // Notify listeners when the state changes
  }

  /// Increments the player's jump count.
  void incrementJumps() {
    _playerData.incrementJumps();
    notifyListeners(); // Notify listeners when the state changes
  }

  /// Increments the player's power-up collection count.
  void incrementPowerUps() {
    _playerData.incrementPowerUps();
    notifyListeners(); // Notify listeners when the state changes
  }

  /// Unlocks a new color for the player.
  void unlockColor(String color) {
    _playerData.unlockColor(color);
    _storageService.saveUnlockedColors(_playerData.unlockedColors);
    notifyListeners(); // Notify listeners when the state changes
  }
}