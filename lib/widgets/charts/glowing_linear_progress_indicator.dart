import 'package:flutter/material.dart';

class GlowingCustomPainter extends CustomPainter {
  final double progress;

  GlowingCustomPainter({
    required this.progress,
  });

  @override
  void paint(Canvas canvas, Size size) {
    Paint backgroundPaint = Paint()
      ..color = const Color(0xFF4B399C).withOpacity(0.1)
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 9.0;

    canvas.drawLine(Offset.zero, Offset(size.width, 0.0), backgroundPaint);

    Paint mainPaint = Paint()
      ..color = const Color(0xFFFFB102)
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 9.0;

    canvas.drawLine(Offset.zero, Offset(size.width * progress, 0.0), mainPaint);

    if (progress > 0.1) {
      Paint glossPaint = Paint()
        ..color = const Color(0xFFFFC800)
        ..strokeCap = StrokeCap.round
        ..strokeWidth = 2.0;

      canvas.drawLine(
        const Offset(4.0, -1.0),
        Offset(size.width * progress - 4.0, -1.0),
        glossPaint,
      );
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // Return true if the painting needs to be updated
    return false;
  }
}

class GlowingLinearProgressIndicator extends StatelessWidget {
  final double value;

  const GlowingLinearProgressIndicator({
    required this.value,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: GlowingCustomPainter(
        progress: value,
      ),
    );
  }
}
