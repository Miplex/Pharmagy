import 'package:flutter/material.dart';

import 'package:pharmagy/constants/constants.dart';

class PaintLineDottedWidget extends CustomPainter {
  PaintLineDottedWidget(
      {required this.sizeLine,
      required this.strokeWidth,
      required this.height,
      required this.width});
  final double sizeLine;
  final double strokeWidth;
  final double width;
  final double height;

  @override
  void paint(Canvas canvas, Size size) {
    double dashWidth = 4.0, dashSpace = 9.0, startY = -40.0;
    Path path = Path()
      ..addOval(Rect.fromCircle(center: Offset(0, sizeLine), radius: 8));

    final solidCircle = Paint()
      ..style = PaintingStyle.fill
      ..color = Colors.white;

    final solidCircleCenter = Paint()
      ..style = PaintingStyle.fill
      ..color = const Color(0xff4076d5);

    final dottedLine = Paint()
      ..style = PaintingStyle.fill
      ..color = kTimeLineColor
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round;

    final solidLine = Paint()
      ..style = PaintingStyle.fill
      ..strokeWidth = 1
      ..color = kTimeLineSolidColor;

    final rectangleBack = Paint()..style = PaintingStyle.fill;

    Rect rect = Rect.fromLTWH(0, sizeLine, width, height);
    canvas.drawRect(rect,
        rectangleBack..shader = kTimeLineCycleBackground.createShader(rect));

    while (startY < sizeLine) {
      canvas.drawLine(
          Offset(0.0, startY), Offset(0.0, startY + dashWidth), dottedLine);
      startY += dashWidth + dashSpace;
    }

    canvas.drawShadow(path, Colors.black, 2, false);
    canvas.drawPath(path, solidCircle);

    canvas.drawCircle(Offset(0.0, sizeLine), 1.0, solidCircle);
    canvas.drawCircle(Offset(0.0, sizeLine), 5.0, solidCircleCenter);

    canvas.drawLine(
        Offset(0.0, sizeLine), Offset(0.0, height), solidLine);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
