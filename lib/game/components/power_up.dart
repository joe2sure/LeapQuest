import 'package:flame/components.dart';
import 'package:flutter/material.dart';
import 'package:leap_quest/config/colors.dart';
import 'package:leap_quest/config/config.dart';
import 'package:leap_quest/core/utils/math_utils.dart';

enum PowerUpType {
  shield,
  jumpBoost,
  magnet,
}

class PowerUp extends PositionComponent {
  final PowerUpType type;
  final Paint _paint;

  PowerUp({
    required this.type,
    required Vector2 position,
  })  : _paint = Paint()..color = _getPowerUpColor(type),
        super(
          position: position,
          size: Vector2.all(GameConfig.powerUpSize),
        );

  @override
  void render(Canvas canvas) {
    // Draw the power-up shape (circle)
    canvas.drawCircle(
      Offset(size.x / 2, size.y / 2),
      size.x / 2,
      _paint,
    );

    // Draw an outline for better visibility
    canvas.drawCircle(
      Offset(size.x / 2, size.y / 2),
      size.x / 2,
      Paint()
        ..color = Colors.white
        ..style = PaintingStyle.stroke
        ..strokeWidth = 2,
    );
  }

  @override
  void update(double dt) {
    super.update(dt);

    // Move the power-up downward (simulate falling)
    position.y += GameConfig.gravity * dt;

    // Remove the power-up if it goes off-screen
    if (position.y > findGame()!.size.y) {
      removeFromParent();
    }
  }

  /// Get the color of the power-up based on its type.
  static Color _getPowerUpColor(PowerUpType type) {
    switch (type) {
      case PowerUpType.shield:
        return GameColors.shieldPowerUp;
      case PowerUpType.jumpBoost:
        return GameColors.jumpPowerUp;
      case PowerUpType.magnet:
        return GameColors.magnetPowerUp;
    }
  }

  /// Factory method to create a random power-up.
  static PowerUp createRandomPowerUp(Vector2 position) {
    final randomType = PowerUpType.values[MathUtils.randomInt(0, PowerUpType.values.length - 1)];
    return PowerUp(
      type: randomType,
      position: position,
    );
  }
}