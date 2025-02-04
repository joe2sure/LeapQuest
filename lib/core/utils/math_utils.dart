import 'dart:math';
import 'package:flame/components.dart';

class MathUtils {
  /// Generates a random double between [min] and [max].
  static double randomDouble(double min, double max) {
    final random = Random();
    return min + random.nextDouble() * (max - min);
  }

  /// Generates a random integer between [min] and [max] (inclusive).
  static int randomInt(int min, int max) {
    final random = Random();
    return min + random.nextInt(max - min + 1);
  }

  /// Linearly interpolates between [start] and [end] based on [t].
  /// [t] is typically a value between 0 and 1.
  static double lerp(double start, double end, double t) {
    return start + (end - start) * t;
  }

  /// Clamps a value between [min] and [max].
  static double clamp(double value, double min, double max) {
    return value < min ? min : (value > max ? max : value);
  }

  /// Maps a value from one range to another.
  static double mapValue(double value, double start1, double end1, double start2, double end2) {
    return start2 + (end2 - start2) * ((value - start1) / (end1 - start1));
  }

  /// Calculates the distance between two points.
  static double distance(Vector2 a, Vector2 b) {
    final dx = a.x - b.x;
    final dy = a.y - b.y;
    return sqrt(dx * dx + dy * dy);
  }

  /// Checks if a value is within a range.
  static bool isInRange(double value, double min, double max) {
    return value >= min && value <= max;
  }

  /// Normalizes a value to a range of 0 to 1.
  static double normalize(double value, double min, double max) {
    return (value - min) / (max - min);
  }

  /// Generates a random boolean with a given probability.
  /// [probability] should be between 0 and 1.
  static bool randomBool(double probability) {
    final random = Random();
    return random.nextDouble() < probability;
  }
}