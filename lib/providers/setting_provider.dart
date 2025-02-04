import 'package:flutter/material.dart';
import 'package:leap_quest/core/services/audio_service.dart';
import 'package:leap_quest/core/services/storage_service.dart';

class SettingsProvider with ChangeNotifier {
  final AudioService _audioService = AudioService();
  final StorageService _storageService = StorageService();

  double _volume = 1.0;
  bool _isMuted = false;

  double get volume => _volume;
  bool get isMuted => _isMuted;

  SettingsProvider() {
    _loadSettings();
  }

  Future<void> _loadSettings() async {
    await _storageService.init();
    _volume = _storageService.getVolume();
    _isMuted = _storageService.getIsMuted();
    notifyListeners();
  }

  void setVolume(double volume) {
    _volume = volume;
    _audioService.setVolume(volume);
    _storageService.saveVolume(volume);
    notifyListeners();
  }

  void toggleMute() {
    _isMuted = !_isMuted;
    _audioService.toggleMute();
    _storageService.saveIsMuted(_isMuted);
    notifyListeners();
  }
}