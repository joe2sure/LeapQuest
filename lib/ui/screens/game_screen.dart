import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:leap_quest/game/minimal_game.dart';
import 'package:leap_quest/ui/widgets/game_hud.dart';
import 'package:leap_quest/game/managers/game_manager.dart';

class GameScreen extends StatelessWidget {
  final MinimalGame game = MinimalGame();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<GameManager>.value(
      value: game.gameManager,
      child: Scaffold(
        body: Stack(
          children: [
            // Game widget
            GameWidget(game: game),

            // Game HUD
            GameHUD(),

            // Pause menu (conditionally rendered)
            Consumer<GameManager>(
              builder: (context, gameManager, _) {
                if (gameManager.isGameOver) {
                  return GameOverMenu();
                }
                return SizedBox.shrink();
              },
            ),
          ],
        ),
      ),
    );
  }
}

class GameOverMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final gameManager = Provider.of<GameManager>(context);

    return Center(
      child: Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.8),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'GAME OVER',
              style: TextStyle(
                color: Colors.white,
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Score: ${gameManager.score.toInt()}',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                gameManager.reset();
                Navigator.of(context).pushReplacementNamed('/game');
              },
              child: Text('RESTART'),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushReplacementNamed('/menu');
              },
              child: Text('QUIT'),
            ),
          ],
        ),
      ),
    );
  }
}