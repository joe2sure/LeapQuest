import 'package:flutter/material.dart';
import 'package:leap_quest/config/colors.dart';

class AppTheme {
  static ThemeData get theme {
    return ThemeData(
      primaryColor: GameColors.primary,
      scaffoldBackgroundColor: GameColors.background,
      textTheme: TextTheme(
        displayLarge: TextStyle(
          color: GameColors.textPrimary,
          fontSize: 32,
          fontWeight: FontWeight.bold,
        ),
        headlineSmall: TextStyle(
          color: GameColors.textPrimary,
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
        bodyLarge: TextStyle(
          color: GameColors.textSecondary,
          fontSize: 16,
        ),
        labelLarge: TextStyle(
          color: Colors.black,
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: GameColors.buttonPrimary,
          padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
    );
  }
}