// ignore_for_file: deprecated_member_use

import 'dart:math';
import 'package:flame/components.dart';
import 'package:flame/particles.dart';
import 'package:flutter/material.dart';

class ParticleFactory {
  static ParticleSystemComponent createExplosion({
    required Vector2 position,
    required Color color,
    int numParticles = 20,
    double spreadRadius = 50,
    double maxRadius = 5,
  }) {
    final random = Random();
    final particle = Particle.generate(
      count: numParticles,
      lifespan: 1,
      generator: (i) {
        final randomAngle = random.nextDouble() * 2 * pi;
        final randomRadius = random.nextDouble() * spreadRadius;
        final randomSize = random.nextDouble() * maxRadius;
        
        return CircleParticle(
          radius: randomSize,
          paint: Paint()..color = color.withOpacity(random.nextDouble()),
          lifespan: 1,
        );
      },
    );

    return ParticleSystemComponent(
      particle: particle,
    );
  }

  static ParticleSystemComponent createTrail({
    required Vector2 position,
    required Color color,
    int numParticles = 10,
    double trailLength = 30,
  }) {
    final random = Random();
    final particle = Particle.generate(
      count: numParticles,
      lifespan: 0.5,
      generator: (i) {
        return CircleParticle(
          radius: 2,
          paint: Paint()..color = color.withOpacity(random.nextDouble()),
          lifespan: 0.5,
        );
      },
    );

    return ParticleSystemComponent(
      particle: particle,
    );
  }
}


// import 'dart:math';
// import 'package:flame/components.dart';
// import 'package:flame/particles.dart';
// import 'package:flutter/material.dart';

// class ParticleFactory {
//   static ParticleSystemComponent createExplosion({
//     required Vector2 position,
//     required Color color,
//     int numParticles = 20,
//     double spreadRadius = 50,
//     double maxRadius = 5,
//   }) {
//     final random = Random();
//     final particle = Particle.generate(
//       count: numParticles,
//       lifespan: 1,
//       generator: (i) {
//         final randomAngle = random.nextDouble() * 2 * pi;
//         final randomRadius = random.nextDouble() * spreadRadius;
//         final randomSize = random.nextDouble() * maxRadius;
//         return CircleParticle(
//           radius: randomSize,
//           paint: Paint()..color = color.withOpacity(random.nextDouble()),
//           position: position + (Vector2(cos(randomAngle), sin(randomAngle)) * randomRadius),
//         );
//       },
//     );

//     return ParticleSystemComponent(
//       particle: particle,
//       position: position,
//     );
//   }

//   static ParticleSystemComponent createTrail({
//     required Vector2 position,
//     required Color color,
//     int numParticles = 10,
//     double trailLength = 30,
//   }) {
//     final random = Random();
//     final particle = Particle.generate(
//       count: numParticles,
//       lifespan: 0.5,
//       generator: (i) {
//         final randomOffset = Vector2(
//           random.nextDouble() * trailLength - trailLength / 2,
//           random.nextDouble() * trailLength,
//         );
//         return CircleParticle(
//           radius: 2,
//           paint: Paint()..color = color.withOpacity(random.nextDouble()),
//           position: position + randomOffset,
//         );
//       },
//     );

//     return ParticleSystemComponent(
//       particle: particle,
//       position: position,
//     );
//   }
// }