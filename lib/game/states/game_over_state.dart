import 'package:flame/components.dart';
// import 'package:flame/game.dart';
import 'package:leap_quest/game/minimal_game.dart';
import 'package:leap_quest/core/services/audio_service.dart';
import 'package:leap_quest/core/services/analytics_service.dart';

class GameOverState extends Component with HasGameRef<MinimalGame> {
  @override
  Future<void> onLoad() async {
    AudioService().playGameOver();
    AnalyticsService().logGameEnd(gameRef.gameManager.score.toInt());
  }

  @override
  void update(double dt) {
    // Handle any game over state updates
  }

  void restartGame() {
    gameRef.gameManager.reset();
    gameRef.removeAll(gameRef.children);
    gameRef.onLoad();
  }

  void quitToMenu() {
    // Handle quitting to menu
    // This might involve changing the game state or navigating to a different screen
  }
}

