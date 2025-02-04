import 'package:flutter/material.dart';

class GameColors {
  // Base colors
  static const Color primary = Color(0xFF1A2038);
  static const Color background = Color(0xFF000000);
  static const Color accent = Color(0xFF00FF00);
 
  // Player colors
  static const Map<String, Color> playerColors = {
    'red': Color(0xFFFF0000),
    'blue': Color(0xFF0000FF),
    'green': Color(0xFF00FF00),
    'yellow': Color(0xFFFFFF00),
    'purple': Color(0xFF800080),
  };


  // Power-up colors
  static const Color shieldPowerUp = Color(0xFF00FFFF);
  static const Color jumpPowerUp = Color(0xFFFFFF00);
  static const Color magnetPowerUp = Color(0xFFFF00FF);


  // Platform colors
  static const Color normalPlatform = Color(0xFFFFFFFF);
  static const Color breakablePlatform = Color(0xFFFF8C00);
  static const Color movingPlatform = Color(0xFF32CD32);


  // UI colors
  static const Color textPrimary = Color(0xFFFFFFFF);
  static const Color textSecondary = Color(0xFFAAAAAA);
  static const Color buttonPrimary = Color(0xFF00FF00);
  static const Color buttonSecondary = Color(0xFF666666);
  static const Color overlay = Color(0x80000000);
}