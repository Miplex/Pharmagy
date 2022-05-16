import 'package:flutter/material.dart';

import '../constants.dart';

class PaintLineSolidWidget extends CustomPainter{
  PaintLineSolidWidget({required this.sizeLine});
  final double sizeLine;
  @override
  void paint(Canvas canvas, Size size) {

    double dashWidth = 3.0, dashSpace = 0.0, startY = 0.0;

    final paint = Paint()
      ..style = PaintingStyle.fill
      ..strokeWidth = 1
      ..color = kTimeLineSolidColor;

    while (startY < sizeLine) {
      canvas.drawLine(Offset(0.0, startY), Offset(0.0, startY + dashWidth), paint);
      startY += dashWidth + dashSpace;
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }

}
