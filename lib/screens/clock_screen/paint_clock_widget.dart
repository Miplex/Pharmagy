import 'dart:ui';

import 'package:flutter/material.dart';
import 'dart:math';

class PaintClockWidget extends CustomPainter {
  // final DateTime _datetime;
  //final double _borderWidth;

  @override
  void paint(Canvas canvas, Size size) {
    final radius = min(size.width, size.height) / 2;
    // final double borderWidth = _borderWidth;
    // double dashWidth = 4.0, dashSpace = 9.0, startY = -50.0;

    var circle1 = Paint()
      ..strokeWidth = 15.0
      ..style = PaintingStyle.stroke
      ..color = Color(0xFF0707070);

    var circle2 = Paint()
      ..strokeWidth = 2.0
      ..style = PaintingStyle.stroke
      ..color = Color(0xFF0707070);

    canvas.translate(size.width / 2, size.height / 2);
    canvas.drawCircle(const Offset(0, 0), radius, circle1);
    //  canvas.drawCircle(const Offset(0, 0), radius/1.3, circle2);

    const double centerX = 0.0; // radius / 8;
    const double centerY = 0.0; //radius / 8;
    const double filledCircleRadius = 1;
    const int numberOfDots = 21;
    const double radiantStep = 2 * pi / numberOfDots;
    for (int i = 0; i < numberOfDots; i++) {
      canvas.drawCircle(
        Offset(centerX + sin(i * radiantStep) * radius / 1.3,
            centerY + cos(i * radiantStep) * radius / 1.3),
        filledCircleRadius,
        circle2,
      );
    }
   // print(radius / 8);
// while (startY < 20) {
//       canvas.drawCircle(Offset(0.0, startY + dashWidth),2.0, circle2);
//       startY += dashWidth + dashSpace;
//     }

    // border style
    // if (borderWidth > 0) {
    //   Paint borderPaint = Paint()
    //     ..color = Color.fromARGB(0, 0, 0, 0)
    //     ..style = PaintingStyle.stroke
    //     ..strokeWidth = borderWidth
    //     ..isAntiAlias = true;
    //   canvas.drawCircle(Offset(0, 0), radius - borderWidth / 2, borderPaint);
    // }

    //drawing center point
    // Paint centerPointPaint = Paint()
    //   ..strokeWidth = ((radius - borderWidth) / 10)
    //   ..strokeCap = StrokeCap.round
    //   ..color = Colors.black;
    // canvas.drawPoints(PointMode.points, [Offset(0, 0)], centerPointPaint);
  }

  @override
  bool shouldRepaint(PaintClockWidget oldDelegate) {
    // return _datetime != oldDelegate._datetime ||
    return false;
  }

  // static double getRadians(double angle) {
  //   return angle * pi / 180;
  // }
}
