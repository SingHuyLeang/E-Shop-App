
import 'package:flutter/material.dart';

class UnderlinePainter extends CustomPainter {
  final Color lineColor;
  final double lineHeight;

  UnderlinePainter(this.lineColor, this.lineHeight);

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = lineColor
      ..strokeWidth = lineHeight;

    canvas.drawLine(
      Offset(0, size.height),
      Offset(size.width, size.height),
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
