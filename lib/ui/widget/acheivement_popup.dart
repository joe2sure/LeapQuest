import 'package:flutter/material.dart';
import 'package:leap_quest/config/colors.dart';
import 'package:leap_quest/core/models/acheivement.dart';

class AchievementPopup extends StatelessWidget {
  final Achievement achievement;

  const AchievementPopup({super.key, required this.achievement});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: GameColors.primary.withOpacity(0.9),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Icon(
            Icons.star,
            color: Colors.yellow,
            size: 40,
          ),
          SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Achievement Unlocked!',
                  style: TextStyle(
                    color: GameColors.textPrimary,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  achievement.title,
                  style: TextStyle(
                    color: GameColors.textPrimary,
                    fontSize: 16,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  achievement.description,
                  style: TextStyle(
                    color: GameColors.textSecondary,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}