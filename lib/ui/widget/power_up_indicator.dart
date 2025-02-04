import 'package:flutter/material.dart';
import 'package:leap_quest/config/colors.dart';
import 'package:leap_quest/core/models/power_up.dart';

class PowerUpIndicator extends StatelessWidget {
  final PowerUpType powerUpType;
  final double duration;

  const PowerUpIndicator({
    Key? key,
    required this.powerUpType,
    required this.duration,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: GameColors.primary.withOpacity(0.7),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            _getIconForPowerUp(powerUpType),
            color: _getColorForPowerUp(powerUpType),
          ),
          SizedBox(width: 8),
          Text(
            '${duration.toStringAsFixed(1)}s',
            style: TextStyle(
              color: GameColors.textPrimary,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  IconData _getIconForPowerUp(PowerUpType type) {
    switch (type) {
      case PowerUpType.shield:
        return Icons.shield;
      case PowerUpType.jumpBoost:
        return Icons.rocket;
      case PowerUpType.magnet:
        return Icons.shield;
    }
  }

  Color _getColorForPowerUp(PowerUpType type) {
    switch (type) {
      case PowerUpType.shield:
        return GameColors.shieldPowerUp;
      case PowerUpType.jumpBoost:
        return GameColors.jumpPowerUp;
      case PowerUpType.magnet:
        return GameColors.magnetPowerUp;
    }
  }
}