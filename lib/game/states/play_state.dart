import 'package:flame/components.dart';
// import 'package:flame/game.dart';
import 'package:leap_quest/game/minimal_game.dart';
import 'package:leap_quest/game/managers/difficulty_manager.dart';
import 'package:leap_quest/game/managers/collision_manager.dart';
import 'package:leap_quest/game/states/game_over_state.dart';

class PlayState extends Component with HasGameRef<MinimalGame> {
  late final DifficultyManager difficultyManager;
  late final CollisionManager collisionManager;

  @override
  Future<void> onLoad() async {
    difficultyManager = DifficultyManager();
    collisionManager = CollisionManager(
      player: gameRef.player,
      platforms: gameRef.platforms,
      powerUps: gameRef.powerUps,
    );

    add(difficultyManager as Component);
    add(collisionManager);
  }

  @override
  void update(double dt) {
    super.update(dt);
    
    gameRef.gameManager.update(dt, gameRef.player);
    difficultyManager.updateDifficulty(gameRef.gameManager.score);

    _managePlatforms();
    _managePowerUps();
    _checkGameOver();
  }

  void _managePlatforms() {
    // Remove off-screen platforms and spawn new ones
    // Similar to the logic in MinimalGame
  }

  void _managePowerUps() {
    // Remove off-screen power-ups and spawn new ones
    // Similar to the logic in MinimalGame
  }

  void _checkGameOver() {
    if (gameRef.player.position.y > gameRef.size.y) {
      gameRef.gameManager.gameOver();
      gameRef.add(GameOverState());
    }
  }
}