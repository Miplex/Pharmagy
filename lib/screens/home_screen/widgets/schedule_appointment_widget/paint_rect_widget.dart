import 'package:flutter/material.dart';

import 'package:pharmagy/constants/constants.dart';

class PaintRectWidget extends CustomPainter{
  PaintRectWidget({required this.left, required this.top, required this.width, required this.height});

  double left;
  double top;
  double width;
  double height;
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..style = PaintingStyle.fill;

    Rect rect =  Rect.fromLTWH(left, top, width, height);
    canvas.drawRect(rect, paint..shader = kTimeLineCycleBackground.createShader(rect));
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }

}