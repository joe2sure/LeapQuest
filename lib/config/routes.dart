import 'package:flutter/material.dart';
import 'package:leap_quest/ui/screens/menu_screen.dart';
import 'package:leap_quest/ui/screens/game_screen.dart';
import 'package:leap_quest/ui/screens/settings_screen.dart';
import 'package:leap_quest/ui/screens/shop_screen.dart';

class AppRoutes {
  static const String menu = '/';
  static const String game = '/game';
  static const String settings = '/settings';
  static const String shop = '/shop';

  static Map<String, WidgetBuilder> getRoutes() {
    return {
      menu: (context) => MenuScreen(),
      game: (context) => GameScreen(),
      settings: (context) => SettingsScreen(),
      shop: (context) => ShopScreen(),
    };
  }
}

