// import 'dart:convert';
// import 'package:flutter/material.dart';

class PlayerData {
  int highScore;
  String selectedColor;
  List<String> unlockedColors;
  Map<String, int> modeHighScores;
  int totalJumps;
  int powerUpsCollected;

  PlayerData({
    this.highScore = 0,
    this.selectedColor = 'red',
    List<String>? unlockedColors,
    Map<String, int>? modeHighScores,
    this.totalJumps = 0,
    this.powerUpsCollected = 0,
  }) : unlockedColors = unlockedColors ?? ['red'],
       modeHighScores = modeHighScores ?? {
         'normal': 0,
         'speed': 0,
         'zen': 0,
       };

  factory PlayerData.fromJson(Map<String, dynamic> json) {
    return PlayerData(
      highScore: json['highScore'] as int,
      selectedColor: json['selectedColor'] as String,
      unlockedColors: List<String>.from(json['unlockedColors']),
      modeHighScores: Map<String, int>.from(json['modeHighScores']),
      totalJumps: json['totalJumps'] as int,
      powerUpsCollected: json['powerUpsCollected'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'highScore': highScore,
      'selectedColor': selectedColor,
      'unlockedColors': unlockedColors,
      'modeHighScores': modeHighScores,
      'totalJumps': totalJumps,
      'powerUpsCollected': powerUpsCollected,
    };
  }

  void updateHighScore(int score, String mode) {
    if (score > highScore) {
      highScore = score;
    }
    
    final modeScore = modeHighScores[mode] ?? 0;
    if (score > modeScore) {
      modeHighScores[mode] = score;
    }
  }

  void unlockColor(String color) {
    if (!unlockedColors.contains(color)) {
      unlockedColors.add(color);
    }
  }

  bool isColorUnlocked(String color) {
    return unlockedColors.contains(color);
  }

  void incrementJumps() {
    totalJumps++;
  }

  void incrementPowerUps() {
    powerUpsCollected++;
  }

  static PlayerData defaultData() {
    return PlayerData(
      highScore: 0,
      selectedColor: 'red',
      unlockedColors: ['red'],
      modeHighScores: {
        'normal': 0,
        'speed': 0,
        'zen': 0,
      },
      totalJumps: 0,
      powerUpsCollected: 0,
    );
  }
}