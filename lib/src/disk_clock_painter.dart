import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_art/src/draw_hand.dart';
import 'package:flutter_art/src/draw_hour_disk.dart';
import 'package:flutter_art/src/draw_minute_disk.dart';
import 'package:flutter_art/src/draw_second_disk.dart';

class DiskClockPainter extends CustomPainter {
  final double radius;
  final Map<String, dynamic> settings;

  DiskClockPainter({
    required this.settings,
    required AnimationController controller,
    required this.radius,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final double strokeWidth = 5.0;
    final Offset center = Offset(size.width / 2, size.height / 2);
    drawHourDisk(
      DateTime.now().hour.toDouble(),
      canvas,
      strokeWidth,
      size,
      settings,
    );
    drawMinuteDisk(
      DateTime.now().minute.toDouble(),
      canvas,
      strokeWidth,
      size,
      settings,
    );
    drawSecondDisk(
      DateTime.now().second.toDouble(),
      canvas,
      strokeWidth,
      size,
      settings,
    );
    drawHand(canvas, center, -math.pi / 2, 0.95 * radius, strokeWidth);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
