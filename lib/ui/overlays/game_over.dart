import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:leap_quest/config/colors.dart';
import 'package:leap_quest/config/constants.dart';
import 'package:leap_quest/providers/game_provider.dart';

class GameOver extends StatelessWidget {
  const GameOver({super.key});

  @override
  Widget build(BuildContext context) {
    final gameProvider = Provider.of<GameProvider>(context);

    return Center(
      child: Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: GameColors.overlay,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'GAME OVER',
              style: TextStyle(
                color: GameColors.textPrimary,
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            Text(
              '${GameConstants.scoreText}${gameProvider.highScore}',
              style: TextStyle(
                color: GameColors.textPrimary,
                fontSize: 24,
              ),
            ),
            SizedBox(height: 20),
            _buildButton(
              text: GameConstants.restartButtonText,
              onPressed: () {
                Navigator.of(context).pushReplacementNamed('/game');
              },
            ),
            SizedBox(height: 10),
            _buildButton(
              text: GameConstants.quitButtonText,
              onPressed: () {
                Navigator.of(context).pushReplacementNamed('/menu');
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildButton({required String text, required VoidCallback onPressed}) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: GameColors.buttonPrimary,
        padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: Colors.black,
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}