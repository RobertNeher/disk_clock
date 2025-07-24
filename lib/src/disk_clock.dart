import 'package:flutter/material.dart';
import 'package:flutter_art/src/disk_clock_painter.dart';

class DiskClock extends StatefulWidget {
  const DiskClock({
    super.key,
    required this.windowSize,
    required this.settings,
  });
  final Size windowSize;
  final Map<String, dynamic> settings;

  @override
  State<DiskClock> createState() => _DiskClockState();
}

void animationListener(AnimationStatus status) {
  if (status == AnimationStatus.completed) {
    // Handle animation completion if needed
  }
}

class _DiskClockState extends State<DiskClock>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: widget.settings['animationSpeed'] ?? 20),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return CustomPaint(
          size: widget.windowSize,
          painter: DiskClockPainter(
            settings: widget.settings,
            controller: _controller,
            radius: widget.windowSize.width / 2,
          ),
        );
      },
    );
  }
}
