import 'package:audioplayers/audioplayers.dart';

class AudioService {
  static final AudioService _instance = AudioService._internal();
  factory AudioService() => _instance;

  final AudioPlayer _audioPlayer = AudioPlayer();
  double _volume = 1.0;
  bool _isMuted = false;

  AudioService._internal();

  Future<void> playJump() async {
    if (!_isMuted) {
      await _audioPlayer.play(AssetSource('audio/jump.mp3'));
    }
  }

  void setVolume(double volume) {
    _volume = volume;
    _audioPlayer.setVolume(_isMuted ? 0 : volume);
  }

  void toggleMute() {
    _isMuted = !_isMuted;
    _audioPlayer.setVolume(_isMuted ? 0 : _volume);
  }
}