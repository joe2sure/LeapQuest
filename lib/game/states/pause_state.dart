import 'package:flame/components.dart';
// import 'package:flame/game.dart';
import 'package:leap_quest/game/minimal_game.dart';

class PauseState extends Component with HasGameRef<MinimalGame> {
  bool _wasMuted = false;

  @override
  Future<void> onLoad() async {
    _wasMuted = gameRef.audioEnabled;
    gameRef.pauseEngine();
    if (!_wasMuted) {
      gameRef.audioEnabled = false;
    }
  }

  void resumeGame() {
    gameRef.resumeEngine();
    if (!_wasMuted) {
      gameRef.audioEnabled = true;
    }
    gameRef.remove(this);
  }

  void quitToMenu() {
    // Handle quitting to menu
    // This might involve changing the game state or navigating to a different screen
  }
}

