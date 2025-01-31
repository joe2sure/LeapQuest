import 'package:leap_quest/core/models/acheivement.dart';
import 'package:leap_quest/core/services/storage_service.dart';
import 'package:leap_quest/config/constants.dart';

class AchievementService {
  static final AchievementService _instance = AchievementService._internal();
  factory AchievementService() => _instance;

  final StorageService _storageService = StorageService();
  List<Achievement> _achievements = [];

  AchievementService._internal();

  Future<void> init() async {
    await _storageService.init();
    _loadAchievements();
  }

  Future<void> _loadAchievements() async {
    final achievementsJson = _storageService.getAchievements();
    if (achievementsJson != null) {
      _achievements = achievementsJson.map((json) => Achievement.fromJson(json)).toList();
    } else {
      _achievements = Achievement.defaultAchievements();
      await _saveAchievements();
    }
  }

  Future<void> _saveAchievements() async {
    final achievementsJson = _achievements.map((achievement) => achievement.toJson()).toList();
    await _storageService.saveAchievements(achievementsJson);
  }

  List<Achievement> get achievements => _achievements;

  Future<void> unlockAchievement(String id) async {
    final achievement = _achievements.firstWhere((a) => a.id == id, orElse: () => throw Exception('Achievement not found'));
    if (!achievement.isUnlocked) {
      achievement.isUnlocked = true;
      await _saveAchievements();
    }
  }

  Future<void> checkAchievements(int score, int jumps, int powerUpsCollected) async {
    for (var achievement in _achievements) {
      if (!achievement.isUnlocked) {
        switch (achievement.id) {
          case GameConstants.achievementBronze:
            if (score >= achievement.requirement) {
              await unlockAchievement(achievement.id);
            }
            break;
          case GameConstants.achievementSilver:
            if (score >= achievement.requirement) {
              await unlockAchievement(achievement.id);
            }
            break;
          case GameConstants.achievementGold:
            if (score >= achievement.requirement) {
              await unlockAchievement(achievement.id);
            }
            break;
          case GameConstants.achievementJumps:
            if (jumps >= achievement.requirement) {
              await unlockAchievement(achievement.id);
            }
            break;
          case GameConstants.achievementPowerUps:
            if (powerUpsCollected >= achievement.requirement) {
              await unlockAchievement(achievement.id);
            }
            break;
        }
      }
    }
  }
}