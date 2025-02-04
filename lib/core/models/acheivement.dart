
class Achievement {
  final String id;
  final String title;
  final String description;
  final int requirement;
  bool isUnlocked;
  final int scoreValue;

  Achievement({
    required this.id,
    required this.title,
    required this.description,
    required this.requirement,
    this.isUnlocked = false,
    required this.scoreValue,
  });

  factory Achievement.fromJson(Map<String, dynamic> json) {
    return Achievement(
      id: json['id'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      requirement: json['requirement'] as int,
      isUnlocked: json['isUnlocked'] as bool,
      scoreValue: json['scoreValue'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'requirement': requirement,
      'isUnlocked': isUnlocked,
      'scoreValue': scoreValue,
    };
  }

  static List<Achievement> defaultAchievements() {
    return [
      Achievement(
        id: 'score_1000',
        title: 'Bronze Jumper',
        description: 'Score 1,000 points in a single game',
        requirement: 1000,
        scoreValue: 100,
      ),
      Achievement(
        id: 'score_5000',
        title: 'Silver Leaper',
        description: 'Score 5,000 points in a single game',
        requirement: 5000,
        scoreValue: 500,
      ),
      Achievement(
        id: 'score_10000',
        title: 'Gold Master',
        description: 'Score 10,000 points in a single game',
        requirement: 10000,
        scoreValue: 1000,
      ),
      Achievement(
        id: 'powerups_10',
        title: 'Power Player',
        description: 'Collect 10 power-ups in a single game',
        requirement: 10,
        scoreValue: 200,
      ),
    ];
  }
}