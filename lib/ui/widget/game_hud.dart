import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:leap_quest/providers/game_provider.dart';

class GameHUD extends StatelessWidget {
  const GameHUD({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<GameProvider>(
      builder: (context, gameProvider, _) {
        return Positioned(
          top: 40,
          left: 0,
          right: 0,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Score: ${gameProvider.score}',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                IconButton(
                  icon: Icon(
                    gameProvider.isMuted ? Icons.volume_off : Icons.volume_up,
                    color: Colors.white,
                  ),
                  onPressed: gameProvider.toggleMute,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}