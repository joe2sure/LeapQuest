import 'package:flutter/material.dart';
import 'package:leap_quest/core/services/storage_service.dart';

class GameProvider with ChangeNotifier {
  int _highScore = 0;
  int _score = 0;
  bool _isMuted = false;

  int get highScore => _highScore;
  int get score => _score;
  bool get isMuted => _isMuted;

  Future<void> init() async {
    final storage = StorageService();
    _highScore = await storage.getHighScore();
    notifyListeners();
  }

  void updateHighScore(int score) {
    if (score > _highScore) {
      _highScore = score;
      StorageService().saveHighScore(score);
      notifyListeners();
    }
  }

  void updateScore(int newScore) {
    _score = newScore;
    notifyListeners();
  }

  void toggleMute() {
    _isMuted = !_isMuted;
    notifyListeners();
  }

  void resumeGame() {
    // Logic to resume the game
    notifyListeners();
  }
}