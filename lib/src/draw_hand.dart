import 'dart:math' as math;

import 'package:flutter/material.dart';

///
/// Draw a fixed clock hand (the backplanes are turning)
///
void drawHand(
  Canvas canvas,
  Offset center,
  double angle,
  double length,
  double strokeWidth,
) {
  final Paint handPaint = Paint()
    ..color = Colors.black.withAlpha(100)
    ..style = PaintingStyle.stroke
    ..strokeWidth = strokeWidth;

  final double x = center.dx + length * math.cos(angle);
  final double y = center.dy + length * math.sin(angle);

  canvas.drawLine(center, Offset(x, y), handPaint);
  canvas.drawLine(
    Offset(
      center.dx + length * math.cos(angle),
      center.dy + length * math.sin(angle),
    ),
    Offset(center.dx - strokeWidth, center.dy + length * math.cos(angle)),
    handPaint,
  );
  canvas.drawLine(
    Offset(
      center.dx + length * math.cos(angle),
      center.dy + length * math.sin(angle),
    ),
    Offset(center.dx + strokeWidth, center.dy + length * math.cos(angle)),
    handPaint,
  );
}
