import 'package:flutter/material.dart';
import 'package:leap_quest/providers/acheivement_provider.dart';
import 'package:provider/provider.dart';
import 'package:leap_quest/providers/game_provider.dart';
import 'package:leap_quest/providers/setting_provider.dart';
import 'package:leap_quest/providers/player_provider.dart';
import 'package:leap_quest/config/routes.dart';
import 'package:leap_quest/config/theme.dart';
import 'package:leap_quest/core/services/ad_service.dart';
import 'package:leap_quest/core/services/analytics_service.dart';
import 'package:leap_quest/core/services/storage_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize services
  await AdService().initialize();
  await AnalyticsService().initialize();
  await StorageService().init();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => GameProvider()),
        ChangeNotifierProvider(create: (_) => SettingsProvider()),
        ChangeNotifierProvider(create: (_) => AchievementProvider()),
        ChangeNotifierProvider(create: (_) => PlayerProvider()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Leap Quest',
      theme: AppTheme.theme,
      initialRoute: AppRoutes.menu,
      routes: AppRoutes.getRoutes(),
      debugShowCheckedModeBanner: false,
    );
  }
}





// import 'package:flutter/material.dart';
// import 'package:leap_quest/providers/acheivement_provider.dart';
// import 'package:leap_quest/providers/setting_provider.dart';
// import 'package:provider/provider.dart';
// import 'package:leap_quest/providers/game_provider.dart';
// import 'package:leap_quest/ui/screens/menu_screen.dart';
// import 'package:leap_quest/ui/screens/game_screen.dart';
// import 'package:leap_quest/ui/screens/settings_screen.dart';

// void main() {
//   runApp(
//     MultiProvider(
//       providers: [
//         ChangeNotifierProvider(create: (_) => GameProvider()),
//         ChangeNotifierProvider(create: (_) => SettingsProvider()),
//         ChangeNotifierProvider(create: (_) => AchievementProvider()),
//       ],
//       child: MyApp(),
//     ),
//   );
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Leap Quest',
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: MenuScreen(),
//       routes: {
//         '/menu': (context) => MenuScreen(),
//         '/game': (context) => GameScreen(),
//         '/settings': (context) => SettingsScreen(),
//       },
//     );
//   }
// }