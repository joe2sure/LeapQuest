import 'package:flame/components.dart';
import 'package:leap_quest/game/components/player.dart';
import 'package:leap_quest/game/components/platform.dart';
import 'package:leap_quest/game/components/power_up.dart';
import 'package:leap_quest/core/utils/collision_helper.dart';

class CollisionManager extends Component {
  final Player player;
  final List<Platform> platforms;
  final List<PowerUp> powerUps;

  CollisionManager({
    required this.player,
    required this.platforms,
    required this.powerUps,
  });

  @override
  void update(double dt) {
    super.update(dt);

    _handlePlatformCollisions();
    _handlePowerUpCollisions();
  }

  void _handlePlatformCollisions() {
    for (final platform in platforms) {
      if (CollisionHelper.isPlayerOnPlatform(player, platform)) {
        player.velocity.y = -10; // Make the player bounce
        if (platform.type == PlatformType.breakable) {
          platform.breakPlatform();
        }
      }
    }
  }

  void _handlePowerUpCollisions() {
    for (final powerUp in powerUps) {
      if (CollisionHelper.isPlayerCollidingWithPowerUp(player, powerUp)) {
        _applyPowerUp(powerUp);
        powerUp.removeFromParent();
        powerUps.remove(powerUp);
        break;
      }
    }
  }

  void _applyPowerUp(PowerUp powerUp) {
    switch (powerUp.type) {
      case PowerUpType.shield:
        player.hasShield = true;
        player.powerUpTimer = 5.0; // Shield duration
        break;
      case PowerUpType.jumpBoost:
        player.velocity.y = -15; // Higher jump
        break;
      case PowerUpType.magnet:
        // Implement magnet logic
        break;
    }
  }
}

