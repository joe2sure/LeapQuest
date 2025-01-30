

import 'package:shared_preferences/shared_preferences.dart';

class StorageService {
  static final _instance = StorageService._internal();
  factory StorageService() => _instance;
  
  late SharedPreferences _prefs;
  
  Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  Future<void> saveHighScore(int score) async {
    final currentHighScore = _prefs.getInt('highScore') ?? 0;
    if (score > currentHighScore) {
      await _prefs.setInt('highScore', score);
    }
  }

  Future<void> saveUnlockedColors(List<String> colors) async {
    await _prefs.setStringList('unlockedColors', colors);
  }

  List<String> getUnlockedColors() {
    return _prefs.getStringList('unlockedColors') ?? ['red'];
  }
}