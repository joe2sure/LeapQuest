enum PowerUpType {
  shield,
  jumpBoost,
  magnet,
}

class PowerUp {
  final PowerUpType type;
  final double duration;

  PowerUp({required this.type, required this.duration});

  factory PowerUp.fromJson(Map<String, dynamic> json) {
    return PowerUp(
      type: PowerUpType.values[json['type'] as int],
      duration: json['duration'] as double,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'type': type.index,
      'duration': duration,
    };
  }

  static PowerUp getRandomPowerUp() {
    final randomType = PowerUpType.values[DateTime.now().millisecond % PowerUpType.values.length];
    final randomDuration = 5.0 + (DateTime.now().microsecond % 5000) / 1000;
    return PowerUp(type: randomType, duration: randomDuration);
  }
}

