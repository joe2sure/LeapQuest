import 'package:audioplayers/audioplayers.dart';


class AudioService {
  static final AudioService _instance = AudioService._internal();
  factory AudioService() => _instance;

  final AudioPlayer _audioPlayer = AudioPlayer();
  final AudioPlayer _backgroundPlayer = AudioPlayer(); // Declare _backgroundPlayer
  double _volume = 1.0;
  bool _isMuted = false;

  AudioService._internal();

  Future<void> playJump() async {
    if (!_isMuted) {
      await _audioPlayer.play(AssetSource('audio/player/jump_sound/boing.wav'));
    }
  }

  Future<void> playGameOver() async {
    if (!_isMuted) {
      await _audioPlayer.play(AssetSource('audio/player/game_over_sound/game_over.wav'));
    }
  }

  Future<void> playBackgroundMusic() async {
    if (!_isMuted) {
      await _backgroundPlayer.play(AssetSource('audio/ui/start_game_sound/game_start.wav'));
    }
  }

  void setVolume(double volume) {
    _volume = volume;
    _audioPlayer.setVolume(_isMuted ? 0 : volume);
    _backgroundPlayer.setVolume(_isMuted ? 0 : volume);
  }

  void toggleMute() {
    _isMuted = !_isMuted;
    _audioPlayer.setVolume(_isMuted ? 0 : _volume);
    _backgroundPlayer.setVolume(_isMuted ? 0 : _volume);
  }

  void stopBackgroundMusic() async {
    await _backgroundPlayer.stop();
  }
}