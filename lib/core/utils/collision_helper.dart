import 'package:flame/components.dart';
import 'package:leap_quest/config/config.dart';


class CollisionHelper {
  /// Checks if the player is colliding with a platform.
  static bool isPlayerOnPlatform(PositionComponent player, PositionComponent platform) {
    return player.position.y + player.size.y >= platform.position.y &&
           player.position.y + player.size.y <= platform.position.y + GameConfig.platformHeight &&
           player.position.x + player.size.x >= platform.position.x &&
           player.position.x <= platform.position.x + GameConfig.platformWidth;
  }

  /// Checks if the player is colliding with a power-up.
  static bool isPlayerCollidingWithPowerUp(PositionComponent player, PositionComponent powerUp) {
    return player.position.x < powerUp.position.x + powerUp.size.x &&
           player.position.x + player.size.x > powerUp.position.x &&
           player.position.y < powerUp.position.y + powerUp.size.y &&
           player.position.y + player.size.y > powerUp.position.y;
  }

  /// Checks if the player is out of bounds (falling off the screen).
  static bool isPlayerOutOfBounds(PositionComponent player, double screenHeight) {
    return player.position.y > screenHeight;
  }

  /// Checks if two rectangular components are colliding.
  static bool isRectColliding(PositionComponent a, PositionComponent b) {
    return a.position.x < b.position.x + b.size.x &&
           a.position.x + a.size.x > b.position.x &&
           a.position.y < b.position.y + b.size.y &&
           a.position.y + a.size.y > b.position.y;
  }

  /// Checks if a point is within a rectangular component.
  static bool isPointInRect(Vector2 point, PositionComponent rect) {
    return point.x >= rect.position.x &&
           point.x <= rect.position.x + rect.size.x &&
           point.y >= rect.position.y &&
           point.y <= rect.position.y + rect.size.y;
  }
}