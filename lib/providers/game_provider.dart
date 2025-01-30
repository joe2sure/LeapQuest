import 'package:flutter/material.dart';

class GameProvider with ChangeNotifier {
  int _highScore = 0;
  GameMode _currentMode = GameMode.normal;
  List<String> _unlockedColors = ['red'];
  String _selectedColor = 'red';
  bool _isMuted = false;

  int get highScore => _highScore;
  GameMode get currentMode => _currentMode;
  List<String> get unlockedColors => _unlockedColors;
  String get selectedColor => _selectedColor;
  bool get isMuted => _isMuted;

  Future<void> init() async {
    final storage = StorageService();
    _highScore = await storage.getHighScore();
    _unlockedColors = await storage.getUnlockedColors();
    notifyListeners();
  }

  void updateHighScore(int score) {
    if (score > _highScore) {
      _highScore = score;
      StorageService().saveHighScore(score);
      notifyListeners();
    }
  }

  void unlockColor(String color) {
    if (!_unlockedColors.contains(color)) {
      _unlockedColors.add(color);
      StorageService().saveUnlockedColors(_unlockedColors);
      notifyListeners();
    }
  }

  void setSelectedColor(String color) {
    _selectedColor = color;
    notifyListeners();
  }

  void toggleMute() {
    _isMuted = !_isMuted;
    AudioService().toggleMute();
    notifyListeners();
  }
}