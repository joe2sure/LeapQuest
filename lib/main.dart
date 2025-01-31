import 'package:flutter/material.dart';
import 'package:leap_quest/providers/acheivement_provider.dart';
import 'package:leap_quest/providers/setting_provider.dart';
import 'package:provider/provider.dart';
import 'package:leap_quest/providers/game_provider.dart';
import 'package:leap_quest/ui/screens/menu_screen.dart';
import 'package:leap_quest/ui/screens/game_screen.dart';
import 'package:leap_quest/ui/screens/settings_screen.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => GameProvider()),
        ChangeNotifierProvider(create: (_) => SettingsProvider()),
        ChangeNotifierProvider(create: (_) => AchievementProvider()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Leap Quest',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MenuScreen(),
      routes: {
        '/menu': (context) => MenuScreen(),
        '/game': (context) => GameScreen(),
        '/settings': (context) => SettingsScreen(),
      },
    );
  }
}