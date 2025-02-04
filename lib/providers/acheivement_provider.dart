import 'package:flutter/material.dart';
import 'package:leap_quest/core/models/acheivement.dart';
import 'package:leap_quest/core/services/acheivement_service.dart';


class AchievementProvider with ChangeNotifier {
  final AchievementService _achievementService = AchievementService();
  List<Achievement> _achievements = [];

  List<Achievement> get achievements => _achievements;

  AchievementProvider() {
    _loadAchievements();
  }

  Future<void> _loadAchievements() async {
    await _achievementService.init();
    _achievements = _achievementService.achievements;
    notifyListeners();
  }

  Future<void> unlockAchievement(String id) async {
    await _achievementService.unlockAchievement(id);
    _achievements = _achievementService.achievements;
    notifyListeners();
  }

  Future<void> checkAchievements(int score, int jumps, int powerUpsCollected) async {
    await _achievementService.checkAchievements(score, jumps, powerUpsCollected);
    _achievements = _achievementService.achievements;
    notifyListeners();
  }
}