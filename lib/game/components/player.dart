import 'dart:math';

import 'package:flame/components.dart';
import 'package:flutter/material.dart';
import 'package:leap_quest/config/config.dart';

class Player extends PositionComponent {
  final Paint _paint;
  Vector2 velocity = Vector2.zero();
  bool hasShield = false;
  double powerUpTimer = 0;

  Player({required Color color}) 
      : _paint = Paint()..color = color,
        super(size: Vector2.all(GameConfig.playerSize));

  @override
  void render(Canvas canvas) {
    // Draw player shape
    canvas.drawRect(
      Rect.fromLTWH(0, 0, size.x, size.y),
      _paint,
    );
    
    // Draw shield if active
    if (hasShield) {
      canvas.drawCircle(
        Offset(size.x / 2, size.y / 2),
        size.x * 0.7,
        Paint()
          ..color = Colors.blue.withOpacity(0.3)
          ..style = PaintingStyle.stroke
          ..strokeWidth = 2,
      );
    }
  }

  @override
  void update(double dt) {
    super.update(dt);

    // Add random horizontal movement
    position.x += Random().nextDouble() * 2 - 1;

    // Clamp position to screen bounds
    position.x = position.x.clamp(0, findGame()!.size.x - size.x);

    if (powerUpTimer > 0) {
      powerUpTimer -= dt;
      if (powerUpTimer <= 0) {
        hasShield = false;
      }
    }
    
    position += velocity * dt;
    velocity.y += GameConfig.gravity;
  }

  /// Make the player jump
  void jump() {
    velocity.y = GameConfig.jumpStrength;
  }
}


// import 'dart:math';

// import 'package:flame/components.dart';
// import 'package:flutter/material.dart';
// import 'package:leap_quest/config/config.dart';

// class Player extends PositionComponent {
//   final Paint _paint;
//   Vector2 velocity = Vector2.zero();
//   bool hasShield = false;
//   double powerUpTimer = 0;

//   Player({required Color color}) 
//       : _paint = Paint()..color = color,
//         super(size: Vector2.all(30));

//   @override
//   void render(Canvas canvas) {
//     // Draw player shape
//     canvas.drawRect(
//       Rect.fromLTWH(0, 0, size.x, size.y),
//       _paint,
//     );
    
//     // Draw shield if active
//     if (hasShield) {
//       canvas.drawCircle(
//         Offset(size.x / 2, size.y / 2),
//         size.x * 0.7,
//         Paint()
//           ..color = Colors.blue.withOpacity(0.3)
//           ..style = PaintingStyle.stroke
//           ..strokeWidth = 2,
//       );
//     }
//   }

//   @override
//   void update(double dt) {
//     super.update(dt);

//     // Add random horizontal movement
//     position.x += Random().nextDouble() * 2 - 1;

//     // Clamp position to screen bounds
//     position.x = position.x.clamp(0, findGame()!.size.x - size.x);

//     if (powerUpTimer > 0) {
//       powerUpTimer -= dt;
//       if (powerUpTimer <= 0) {
//         hasShield = false;
//       }
//     }
    
//     position += velocity * dt;
//     velocity.y += GameConfig.gravity;
//   }
// }