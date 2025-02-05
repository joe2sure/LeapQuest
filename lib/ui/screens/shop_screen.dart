import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:leap_quest/config/colors.dart';
import 'package:leap_quest/providers/player_provider.dart';

class ShopScreen extends StatelessWidget {
  const ShopScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Shop'),
        backgroundColor: GameColors.primary,
      ),
      body: Consumer<PlayerProvider>(
        builder: (context, playerProvider, child) {
          return ListView(
            padding: EdgeInsets.all(16),
            children: [
              Text(
                'Select Player Color',
                style: TextStyle(
                  color: GameColors.textPrimary,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 16),
              Wrap(
                spacing: 16,
                runSpacing: 16,
                children: GameColors.playerColors.entries.map((entry) {
                  final color = entry.value;
                  final colorName = entry.key;
                  final isUnlocked = playerProvider.playerData.isColorUnlocked(colorName);
                  final isSelected = playerProvider.playerData.selectedColor == colorName;

                  return GestureDetector(
                    onTap: () {
                      if (isUnlocked) {
                        playerProvider.selectColor(colorName);
                      } else {
                        // Show dialog to unlock color
                        _showUnlockColorDialog(context, playerProvider, colorName);
                      }
                    },
                    child: Container(
                      width: 80,
                      height: 80,
                      decoration: BoxDecoration(
                        color: color,
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: isSelected ? Colors.white : Colors.transparent,
                          width: 3,
                        ),
                      ),
                      child: isUnlocked
                          ? null
                          : Icon(Icons.lock, color: Colors.white),
                    ),
                  );
                }).toList(),
              ),
            ],
          );
        },
      ),
    );
  }

  void _showUnlockColorDialog(BuildContext context, PlayerProvider playerProvider, String colorName) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Unlock Color'),
        content: Text('Do you want to unlock this color for 1000 coins?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              // TODO: Implement coin system and check if player has enough coins
              playerProvider.unlockColor(colorName);
              Navigator.pop(context);
            },
            child: Text('Unlock'),
          ),
        ],
      ),
    );
  }
}