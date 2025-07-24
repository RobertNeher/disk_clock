import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_art/src/helper.dart';

class Particle {
  double speedX = 0;
  double speedY = 0;
  double radius = 0;
  Offset position = Offset.zero;
  Color color = Colors.black;

  Particle(Map<String, dynamic> settings, Size windowSize) {
    speedX = Random().nextDouble() * settings['particle']['maxSpeedX'];
    speedY =
        Random().nextDouble() *
        // Random(DateTime.now().millisecondsSinceEpoch).nextDouble() *
        settings['particle']['maxSpeedY'];
    radius = Random().nextDouble() * settings['particle']['maxRadius'] / 2;
    position = Offset(
      Random().nextDouble() * windowSize.width,
      Random().nextDouble() * windowSize.height,
    );
    color = randomColor();
  }
}

class Particles {
  List<Particle> particles = <Particle>[];
  Particles(Map<String, dynamic> settings, Size windowSize) {
    for (int i = 0; i < (settings['maxParticles']); i++) {
      particles.add(Particle(settings, windowSize));
    }
  }
}
