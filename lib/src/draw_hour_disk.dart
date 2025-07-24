import 'dart:math' as math;
import 'dart:ui';

import 'package:flutter/material.dart';

///
/// Draw a fixed clock hand (the backplanes are turning)
///
void drawHourDisk(
  double hour,
  Canvas canvas,
  double strokeWidth,
  Size size,
  Map<String, dynamic> settings,
) {
  final Paint clockDiscPaint = Paint()
    ..color = Color(
      int.parse(settings['backgroundColor'].replaceFirst('#', '0x')),
    )
    ..style = PaintingStyle.fill;

  final Paint borderPaint = Paint()
    ..color = Colors.black
    ..style = PaintingStyle.stroke
    ..strokeWidth = 10;

  final Offset center = Offset(size.width / 2, size.height / 2);

  final Paint minuteTickPainter = borderPaint..strokeWidth = 2;

  // Draw the clock disc
  canvas.drawCircle(center, size.width / 2, clockDiscPaint);
  //Draw outer border
  final double tickLength = 20;
  final double weightedRadius = (size.width + size.height) / 4;
  canvas.drawCircle(center, weightedRadius, borderPaint);
  Offset startTick;
  Offset endTick;
  TextStyle textStyle;
  TextSpan textSpan;
  TextPainter textPainter = TextPainter(
    textDirection: TextDirection.ltr,
    textAlign: TextAlign.center,
  );

  for (int tick = 0; tick < 24; tick++) {
    double angle =
        ((tick * 2 * math.pi) / 24) + hour * (2 * math.pi / 24) - math.pi / 2;

    endTick = Offset(
      center.dx + weightedRadius * math.cos(angle),
      center.dy + weightedRadius * math.sin(angle),
    );

    startTick = Offset(
      center.dx + (weightedRadius - tickLength / 2) * math.cos(angle),
      center.dy + (weightedRadius - tickLength / 2) * math.sin(angle),
    );

    // Draw hour ticks
    canvas.drawLine(startTick, endTick, minuteTickPainter);

    textStyle = TextStyle(
      color: Colors.black.withAlpha(100),
      fontSize: settings['fontSize'] * 2,
      fontFamily: settings['fontFamily'],
      fontWeight: FontWeight.bold,
    );

    textSpan = TextSpan(text: tick.toString(), style: textStyle);
    textPainter = TextPainter(
      text: textSpan,
      textDirection: TextDirection.ltr,
      textAlign: TextAlign.center,
    );
    textPainter.layout();
    textPainter.paint(
      canvas,
      Offset(
        center.dx +
            (weightedRadius - 32) * math.cos(angle) -
            textPainter.width / 2,
        center.dy +
            (weightedRadius - 32) * math.sin(angle) -
            textPainter.height / 2,
      ),
    );
  }
}
