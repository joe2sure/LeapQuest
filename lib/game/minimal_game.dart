import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flame/input.dart';
import 'package:flutter/material.dart';
import 'package:leap_quest/config/config.dart';
import 'package:leap_quest/game/components/player.dart';
import 'package:leap_quest/game/components/platform.dart';
import 'package:leap_quest/game/components/power_up.dart';
import 'package:leap_quest/game/managers/difficulty_manager.dart';
import 'package:leap_quest/game/managers/game_manager.dart';
import 'package:leap_quest/core/utils/collision_helper.dart';
import 'package:leap_quest/core/utils/math_utils.dart';
import 'package:leap_quest/core/services/audio_service.dart';

class MinimalGame extends FlameGame with TapDetector {
  late Player player;
  final List<Platform> platforms = [];
  final List<PowerUp> powerUps = [];
  final List<EnemyBrick> enemies = [];
  final DifficultyManager difficultyManager = DifficultyManager();
  final GameManager gameManager = GameManager();

  @override
  Future<void> onLoad() async {
    await AudioService().playBackgroundMusic();
    _initializeGame();
  }

  void _initializeGame() {
    // Initialize player
    player = Player(color: Colors.red);
    player.position = Vector2(size.x / 2, size.y - GameConfig.playerSize * 2);
    add(player);

    // Initialize initial platforms
    for (var i = 0; i < GameConfig.platformPoolSize; i++) {
      final platform = Platform.createRandomPlatform(
        Vector2(
          MathUtils.randomDouble(0, size.x - GameConfig.platformWidth),
          size.y - (i * GameConfig.initialPlatformGap),
        ),
      );
      platforms.add(platform);
      add(platform);
    }
  }

  @override
  void update(double dt) {
    super.update(dt);

    if (!gameManager.isGameOver) {
      // Update game manager
      gameManager.update(dt, player);

      // Update difficulty
      difficultyManager.updateDifficulty(gameManager.score);

      // Manage platforms
      _managePlatforms(dt);

      // Manage power-ups
      _managePowerUps(dt);

      // Manage enemies
      _manageEnemies(dt);

      // Check for collisions
      _checkCollisions();

      // Check for game over
      _checkGameOver();
    }
  }

  void _managePlatforms(double dt) {
    // Remove off-screen platforms and spawn new ones
    platforms.removeWhere((platform) {
      if (platform.position.y > size.y) {
        platform.removeFromParent();
        return true;
      }
      return false;
    });

    // Spawn new platforms if needed
    if (platforms.last.position.y > GameConfig.initialPlatformGap) {
      final platform = Platform.createRandomPlatform(
        Vector2(
          MathUtils.randomDouble(0, size.x - GameConfig.platformWidth),
          platforms.last.position.y - difficultyManager.platformGap,
        ),
      );
      platforms.add(platform);
      add(platform);
    }
  }

  void _managePowerUps(double dt) {
    // Remove off-screen power-ups
    powerUps.removeWhere((powerUp) {
      if (powerUp.position.y > size.y) {
        powerUp.removeFromParent();
        return true;
      }
      return false;
    });

    // Spawn new power-ups randomly
    if (MathUtils.randomBool(difficultyManager.powerUpChance)) {
      final powerUp = PowerUp.createRandomPowerUp(
        Vector2(
          MathUtils.randomDouble(0, size.x - GameConfig.powerUpSize),
          -GameConfig.powerUpSize,
        ),
      );
      powerUps.add(powerUp);
      add(powerUp);
    }
  }

  void _manageEnemies(double dt) {
    // Remove off-screen enemies
    enemies.removeWhere((enemy) {
      if (enemy.position.y > size.y) {
        enemy.removeFromParent();
        return true;
      }
      return false;
    });

    // Spawn new enemies randomly
    if (MathUtils.randomBool(difficultyManager.enemySpawnChance)) {
      final enemy = EnemyBrick();
      enemies.add(enemy);
      add(enemy);
    }
  }

  void _checkCollisions() {
    // Check player-platform collisions
    for (final platform in platforms) {
      if (CollisionHelper.isPlayerOnPlatform(player, platform)) {
        player.velocity.y = GameConfig.jumpForce;
        AudioService().playJump(); // Play jump sound
        gameManager.incrementJumps();

        if (platform.type == PlatformType.breakable) {
          platform.breakPlatform();
        }
      }
    }

    // Check player-power-up collisions
    for (final powerUp in powerUps) {
      if (CollisionHelper.isPlayerCollidingWithPowerUp(player, powerUp)) {
        _applyPowerUp(powerUp.type);
        powerUp.removeFromParent();
        powerUps.remove(powerUp);
        gameManager.incrementPowerUps();
        break;
      }
    }

    // Check player-enemy collisions
    for (final enemy in enemies) {
      if (CollisionHelper.isRectColliding(player, enemy)) {
        gameManager.gameOver();
        AudioService().playGameOver(); // Play game-over sound
        break;
      }
    }
  }

  void _applyPowerUp(PowerUpType type) {
    switch (type) {
      case PowerUpType.shield:
        player.hasShield = true;
        player.powerUpTimer = GameConfig.shieldDuration;
        break;
      case PowerUpType.jumpBoost:
        player.velocity.y = GameConfig.jumpForce * 1.5;
        break;
      case PowerUpType.magnet:
        // Implement magnet logic (e.g., attract nearby power-ups)
        break;
    }
  }

  void _checkGameOver() {
    if (CollisionHelper.isPlayerOutOfBounds(player, size.y)) {
      gameManager.gameOver();
      AudioService().playGameOver(); // Play game-over sound
    }
  }

  @override
  void onTap() {
    if (!gameManager.isGameOver) {
      player.velocity.y = GameConfig.jumpForce;
    }
  }
}

class EnemyBrick extends PositionComponent {
  EnemyBrick() : super(size: Vector2.all(30));

  @override
  void update(double dt) {
    super.update(dt);
    position.y += GameConfig.gravity * dt;

    if (position.y > findGame()!.size.y) {
      removeFromParent();
    }
  }
}


// import 'package:flame/game.dart';
// import 'package:flame/input.dart';
// // import 'package:flutter/material.dart';
// import 'package:leap_quest/config/config.dart';
// import 'package:leap_quest/core/services/audio_service.dart';
// import 'package:leap_quest/game/components/player.dart';
// import 'package:leap_quest/game/components/platform.dart';
// import 'package:leap_quest/game/components/power_up.dart';
// import 'package:leap_quest/game/managers/difficulty_manager.dart';
// import 'package:leap_quest/game/managers/game_manager.dart';
// import 'package:leap_quest/core/utils/collision_helper.dart';
// import 'package:leap_quest/core/utils/math_utils.dart';

// class MinimalGame extends FlameGame with TapDetector {
//   late Player player;
//   final List<Platform> platforms = [];
//   final List<PowerUp> powerUps = [];
//   final DifficultyManager difficultyManager = DifficultyManager();
//   final GameManager gameManager = GameManager();

//   // @override
//   // Future<void> onLoad() async {
//   //   await super.onLoad();
//   //   _initializeGame();
//   // }
//   @override
//   Future<void> onLoad() async {
//     await AudioService().playBackgroundMusic();
//   }


//   @override
//   void update(double dt) {
//     super.update(dt);

//     if (!gameManager.isGameOver) {
//       // Update game manager
//       gameManager.update(dt, player);

//       // Update difficulty
//       difficultyManager.updateDifficulty(gameManager.score);

//       // Manage platforms
//       _managePlatforms(dt);

//       // Manage power-ups
//       _managePowerUps(dt);

//       // Check for collisions
//       _checkCollisions();

//       // Check for game over
//       _checkGameOver();
//     }
//   }

//   void _managePlatforms(double dt) {
//     // Remove off-screen platforms and spawn new ones
//     platforms.removeWhere((platform) {
//       if (platform.position.y > size.y) {
//         platform.removeFromParent();
//         return true;
//       }
//       return false;
//     });

//     // Spawn new platforms if needed
//     if (platforms.last.position.y > GameConfig.initialPlatformGap) {
//       final platform = Platform.createRandomPlatform(
//         Vector2(
//           MathUtils.randomDouble(0, size.x - GameConfig.platformWidth),
//           platforms.last.position.y - difficultyManager.platformGap,
//         ),
//       );
//       platforms.add(platform);
//       add(platform);
//     }
//   }

//   void _managePowerUps(double dt) {
//     // Remove off-screen power-ups
//     powerUps.removeWhere((powerUp) {
//       if (powerUp.position.y > size.y) {
//         powerUp.removeFromParent();
//         return true;
//       }
//       return false;
//     });

//     // Spawn new power-ups randomly
//     if (MathUtils.randomBool(difficultyManager.powerUpChance)) {
//       final powerUp = PowerUp.createRandomPowerUp(
//         Vector2(
//           MathUtils.randomDouble(0, size.x - GameConfig.powerUpSize),
//           -GameConfig.powerUpSize,
//         ),
//       );
//       powerUps.add(powerUp);
//       add(powerUp);
//     }
//   }

//   // Play jump sound when the player lands on a platform
//   void _checkCollisions() {
//     for (final platform in platforms) {
//       if (CollisionHelper.isPlayerOnPlatform(player, platform)) {
//         player.velocity.y = GameConfig.jumpForce;
//         AudioService().playJump(); // Play jump sound
//       }
//     }
//   }

//   // Play game-over sound when the game ends
//   void _checkGameOver() {
//     if (CollisionHelper.isPlayerOutOfBounds(player, size.y)) {
//       gameManager.gameOver();
//       AudioService().playGameOver(); // Play game-over sound
//     }
//   }


//   void _applyPowerUp(PowerUpType type) {
//     switch (type) {
//       case PowerUpType.shield:
//         player.hasShield = true;
//         player.powerUpTimer = GameConfig.shieldDuration;
//         break;
//       case PowerUpType.jumpBoost:
//         player.velocity.y = GameConfig.jumpForce * 1.5;
//         break;
//       case PowerUpType.magnet:
//         // Implement magnet logic (e.g., attract nearby power-ups)
//         break;
//     }
//   }



//   @override
//   void onTap() {
//     if (!gameManager.isGameOver) {
//       player.velocity.y = GameConfig.jumpForce;
//     }
//   }
// }