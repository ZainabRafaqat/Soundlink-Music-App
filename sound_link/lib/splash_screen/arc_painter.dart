import 'package:flutter/material.dart';

class ArcPainter extends CustomPainter {
  final Color color;
  final double iconsSize;

  ArcPainter({required this.color, this.iconsSize = 3});

  @override
  void paint(Canvas canvas, Size size) {
    Paint p = Paint()
      ..color = color
      ..strokeWidth = 1
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;

    Rect rect = Rect.fromLTWH(0, 0, size.width, size.height);

    canvas.drawArc(rect, 0.15, 0.9 * 3.14, false, p);
    canvas.drawArc(rect, 1.05 * 3.14, 0.9 * 3.14, false, p);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
