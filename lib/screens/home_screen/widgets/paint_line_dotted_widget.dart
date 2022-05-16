import 'package:flutter/material.dart';

import 'package:pharmagy/constants/constants.dart';

class PaintLineDottedWidget extends CustomPainter{
PaintLineDottedWidget({required this.sizeLine, required this.strokeWidth});
final double sizeLine;
final double strokeWidth;
  @override
  void paint(Canvas canvas, Size size) {

    double dashWidth = 4.0, dashSpace = 9.0, startY = -25.0;

    final paint = Paint()
      ..style = PaintingStyle.fill
      ..color = kTimeLineColor
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round;

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