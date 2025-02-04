import 'package:flame/components.dart';
import 'package:flutter/material.dart';
import 'package:leap_quest/config/colors.dart';
import 'package:leap_quest/config/config.dart';
import 'package:leap_quest/core/utils/math_utils.dart';

enum PlatformType {
  normal,
  breakable,
  moving,
}

class Platform extends PositionComponent {
  final PlatformType type;
  final Paint _paint;
  bool _isBreaking = false;
  double _breakTimer = 0.0;
  double _moveDirection = 1.0; // 1 for right, -1 for left

  Platform({
    required this.type,
    required Vector2 position,
  })  : _paint = Paint()..color = _getPlatformColor(type),
        super(
          position: position,
          size: Vector2(GameConfig.platformWidth, GameConfig.platformHeight),
        );

  @override
  void render(Canvas canvas) {
    canvas.drawRect(
      Rect.fromLTWH(0, 0, size.x, size.y),
      _paint,
    );

    // Draw breaking effect if applicable
    if (_isBreaking) {
      canvas.drawRect(
        Rect.fromLTWH(0, 0, size.x * (1 - _breakTimer), size.y),
        Paint()..color = Colors.red.withOpacity(0.5),
      );
    }
  }

  @override
  void update(double dt) {
    super.update(dt);

    // Handle platform movement (for moving platforms)
    if (type == PlatformType.moving) {
      position.x += _moveDirection * GameConfig.moveSpeed * dt;

      // Reverse direction if hitting screen edges or obstacles
      if (position.x <= 0 || position.x + size.x >= findGame()!.size.x) {
        _moveDirection *= -1;
      }
    }

    // Handle breaking effect (for breakable platforms)
    if (_isBreaking) {
      _breakTimer += dt;
      if (_breakTimer >= 1.0) {
        removeFromParent(); // Remove platform after breaking
      }
    }
  }

  /// Trigger the breaking effect for breakable platforms.
  void breakPlatform() {
    if (type == PlatformType.breakable) {
      _isBreaking = true;
    }
  }

  /// Reset the platform to its initial state
  void reset() {
    _isBreaking = false;
    _breakTimer = 0.0;
    _moveDirection = 1.0;
  }

  /// Get the color of the platform based on its type.
  static Color _getPlatformColor(PlatformType type) {
    switch (type) {
      case PlatformType.normal:
        return GameColors.normalPlatform;
      case PlatformType.breakable:
        return GameColors.breakablePlatform;
      case PlatformType.moving:
        return GameColors.movingPlatform;
    }
  }

  /// Factory method to create a random platform.
  static Platform createRandomPlatform(Vector2 position) {
    final randomType = PlatformType.values[MathUtils.randomInt(0, PlatformType.values.length - 1)];
    return Platform(
      type: randomType,
      position: position,
    );
  }
}


// import 'package:flame/components.dart';
// import 'package:flutter/material.dart';
// import 'package:leap_quest/config/colors.dart';
// import 'package:leap_quest/config/config.dart';
// import 'package:leap_quest/core/utils/math_utils.dart';

// enum PlatformType {
//   normal,
//   breakable,
//   moving,
// }

// class Platform extends PositionComponent {
//   final PlatformType type;
//   final Paint _paint;
//   bool _isBreaking = false;
//   double _breakTimer = 0.0;
//   double _moveDirection = 1.0; // 1 for right, -1 for left

//   Platform({
//     required this.type,
//     required Vector2 position,
//   })  : _paint = Paint()..color = _getPlatformColor(type),
//         super(
//           position: position,
//           size: Vector2(GameConfig.platformWidth, GameConfig.platformHeight),
//         );

//   @override
//   void render(Canvas canvas) {
//     canvas.drawRect(
//       Rect.fromLTWH(0, 0, size.x, size.y),
//       _paint,
//     );

//     // Draw breaking effect if applicable
//     if (_isBreaking) {
//       canvas.drawRect(
//         Rect.fromLTWH(0, 0, size.x * (1 - _breakTimer), size.y),
//         Paint()..color = Colors.red.withOpacity(0.5),
//       );
//     }
//   }

//   @override
//   void update(double dt) {
//     super.update(dt);

//     // Handle platform movement (for moving platforms)
//     if (type == PlatformType.moving) {
//       position.x += _moveDirection * GameConfig.moveSpeed * dt;

//       // Reverse direction if hitting screen edges or obstacles
//       if (position.x <= 0 || position.x + size.x >= findGame()!.size.x) {
//         _moveDirection *= -1;
//       }
//     }

//     // Handle breaking effect (for breakable platforms)
//     if (_isBreaking) {
//       _breakTimer += dt;
//       if (_breakTimer >= 1.0) {
//         removeFromParent(); // Remove platform after breaking
//       }
//     }
//   }

//   /// Trigger the breaking effect for breakable platforms.
//   void breakPlatform() {
//     if (type == PlatformType.breakable) {
//       _isBreaking = true;
//     }
//   }

// void reset() {
//   // Reset platform to initial state
//   _isBreaking = false;
//   _breakTimer = 0.0;
//   _moveDirection = 1.0;
  
//   // Optionally, you might want to reset to a random type
//   // type = Platform.createRandomPlatform(Vector2.zero()).type;
// }

//   /// Get the color of the platform based on its type.
//   static Color _getPlatformColor(PlatformType type) {
//     switch (type) {
//       case PlatformType.normal:
//         return GameColors.normalPlatform;
//       case PlatformType.breakable:
//         return GameColors.breakablePlatform;
//       case PlatformType.moving:
//         return GameColors.movingPlatform;
//     }
//   }

//   /// Factory method to create a random platform.
//   static Platform createRandomPlatform(Vector2 position) {
//     final randomType = PlatformType.values[MathUtils.randomInt(0, PlatformType.values.length - 1)];
//     return Platform(
//       type: randomType,
//       position: position,
//     );
//   }
// }