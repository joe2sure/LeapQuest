import 'package:flutter/material.dart';
import 'package:leap_quest/core/models/player_data.dart';
import 'package:leap_quest/core/services/storage_service.dart';

class PlayerProvider extends ChangeNotifier {
  PlayerData _playerData = PlayerData.defaultData();
  final StorageService _storageService = StorageService();

  PlayerData get playerData => _playerData;

  Future<void> loadPlayerData() async {
    final json = await _storageService.getData('player_data');
    if (json != null) {
      _playerData = PlayerData.fromJson(json);
    }
    notifyListeners();
  }

  Future<void> savePlayerData() async {
    await _storageService.saveData('player_data', _playerData.toJson());
  }

  void updateHighScore(int score) {
    if (score > _playerData.highScore) {
      _playerData.highScore = score;
      savePlayerData();
      notifyListeners();
    }
  }

  void unlockColor(String color) {
    _playerData.unlockColor(color);
    savePlayerData();
    notifyListeners();
  }

  void selectColor(String color) {
    _playerData.selectedColor = color;
    savePlayerData();
    notifyListeners();
  }

  void incrementTotalJumps() {
    _playerData.totalJumps++;
    savePlayerData();
    notifyListeners();
  }

  void incrementPowerUpsCollected() {
    _playerData.powerUpsCollected++;
    savePlayerData();
    notifyListeners();
  }
}



// import 'package:flutter/material.dart';
// import 'package:leap_quest/core/models/player_data.dart';
// import 'package:leap_quest/core/services/storage_service.dart';

// class PlayerProvider extends ChangeNotifier {
//   PlayerData _playerData = PlayerData.defaultData();
//   final StorageService _storageService = StorageService();

//   PlayerData get playerData => _playerData;

//   Future<void> loadPlayerData() async {
//     final json = await _storageService.getPlayerData();
//     if (json != null) {
//       _playerData = PlayerData.fromJson(json);
//     }
//     notifyListeners();
//   }

//   Future<void> savePlayerData() async {
//     await _storageService.savePlayerData(_playerData.toJson());
//   }

//   void updateHighScore(int score) {
//     if (score > _playerData.highScore) {
//       _playerData.highScore = score;
//       savePlayerData();
//       notifyListeners();
//     }
//   }

//   void unlockColor(String color) {
//     _playerData.unlockColor(color);
//     savePlayerData();
//     notifyListeners();
//   }

//   void selectColor(String color) {
//     _playerData.selectedColor = color;
//     savePlayerData();
//     notifyListeners();
//   }

//   void incrementTotalJumps() {
//     _playerData.totalJumps++;
//     savePlayerData();
//     notifyListeners();
//   }

//   void incrementPowerUpsCollected() {
//     _playerData.powerUpsCollected++;
//     savePlayerData();
//     notifyListeners();
//   }
// }