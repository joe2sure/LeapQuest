import 'package:flame/components.dart';
import 'package:flame/flame.dart';
import 'package:flame/sprite.dart';

class SpriteLoader {
  static final Map<String, Sprite> _cache = {};

  static Future<Sprite> load(String path) async {
    if (_cache.containsKey(path)) {
      return _cache[path]!;
    }

    final image = await Flame.images.load(path);
    final sprite = Sprite(image);
    _cache[path] = sprite;
    return sprite;
  }

  static Future<SpriteAnimation> loadAnimation({
    required String path,
    required int amount,
    required double stepTime,
    bool loop = true,
  }) async {
    final sprites = await Future.wait(
      List.generate(amount, (index) => load('$path$index.png')),
    );

    return SpriteAnimation.spriteList(
      sprites,
      stepTime: stepTime,
      loop: loop,
    );
  }

  static void clearCache() {
    _cache.clear();
  }
}