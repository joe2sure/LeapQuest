import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class StorageService {
  static final _instance = StorageService._internal();
  factory StorageService() => _instance;

  late SharedPreferences _prefs;

  StorageService._internal();

  Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  // Generic method to save data
  Future<void> saveData(String key, dynamic value) async {
    if (value is int) {
      await _prefs.setInt(key, value);
    } else if (value is double) {
      await _prefs.setDouble(key, value);
    } else if (value is bool) {
      await _prefs.setBool(key, value);
    } else if (value is String) {
      await _prefs.setString(key, value);
    } else if (value is List<String>) {
      await _prefs.setStringList(key, value);
    } else {
      // For complex objects, convert to JSON
      await _prefs.setString(key, jsonEncode(value));
    }
  }

  // Generic method to retrieve data
  dynamic getData(String key) {
    return _prefs.get(key);
  }

  // Existing specific methods remain the same
  Future<void> saveHighScore(int score) async {
    await _prefs.setInt('highScore', score);
  }

  Future<int> getHighScore() async {
    return _prefs.getInt('highScore') ?? 0;
  }

  Future<void> saveVolume(double volume) async {
    await _prefs.setDouble('volume', volume);
  }

  double getVolume() {
    return _prefs.getDouble('volume') ?? 1.0;
  }

  Future<void> saveIsMuted(bool isMuted) async {
    await _prefs.setBool('isMuted', isMuted);
  }

  bool getIsMuted() {
    return _prefs.getBool('isMuted') ?? false;
  }

  Future<void> saveAchievements(List<Map<String, dynamic>> achievements) async {
    final json = achievements.map((e) => jsonEncode(e)).toList();
    await _prefs.setStringList('achievements', json);
  }

  List<Map<String, dynamic>>? getAchievements() {
    final json = _prefs.getStringList('achievements');
    return json?.map((e) => jsonDecode(e) as Map<String, dynamic>).toList();
  }

  Future<void> saveUnlockedColors(List<String> colors) async {
    await _prefs.setStringList('unlockedColors', colors);
  }
}



// import 'dart:convert';

// import 'package:shared_preferences/shared_preferences.dart';

// class StorageService {
//   static final _instance = StorageService._internal();
//   factory StorageService() => _instance;

//   late SharedPreferences _prefs;

//   StorageService._internal();

//   Future<void> init() async {
//     _prefs = await SharedPreferences.getInstance();
//   }

//   Future<void> saveHighScore(int score) async {
//     await _prefs.setInt('highScore', score);
//   }

//   Future<int> getHighScore() async {
//     return _prefs.getInt('highScore') ?? 0;
//   }

//   Future<void> saveVolume(double volume) async {
//     await _prefs.setDouble('volume', volume);
//   }

//   double getVolume() {
//     return _prefs.getDouble('volume') ?? 1.0;
//   }

//   Future<void> saveIsMuted(bool isMuted) async {
//     await _prefs.setBool('isMuted', isMuted);
//   }

//   bool getIsMuted() {
//     return _prefs.getBool('isMuted') ?? false;
//   }

//   Future<void> saveAchievements(List<Map<String, dynamic>> achievements) async {
//     final json = achievements.map((e) => jsonEncode(e)).toList();
//     await _prefs.setStringList('achievements', json);
//   }

//   List<Map<String, dynamic>>? getAchievements() {
//     final json = _prefs.getStringList('achievements');
//     return json?.map((e) => jsonDecode(e) as Map<String, dynamic>).toList();
//   }

 
//   Future<void> saveUnlockedColors(List<String> colors) async {
//     await _prefs.setStringList('unlockedColors', colors);
//   }
// }