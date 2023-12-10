import 'package:flutter/material.dart';
import 'dart:math';
import 'dart:ui' as ui;


class PaintClockWidget extends CustomPainter {
  //hardcore
  var dateTime = DateTime.now();
  var secSize = pi / 50;

  @override
  void paint(Canvas canvas, Size size) {
    final radius = min(size.width, size.height) / 2;
    final radiusInnerClock = min(size.width, size.height) / 3;

    double centerXs = 0.0;
    double centerYs = 0.0;
    //var center = Offset(centerX, centerY);
     //var radius = min(centerX, centerY);

    var solidCircle = Paint()
      ..strokeWidth = 15.0
      ..style = PaintingStyle.stroke
      ..color = const Color(0xff3481EF);

    var backgroundCircleInnerClock = Paint()
      ..strokeWidth = 90.0
      ..style = PaintingStyle.stroke
      ..shader = ui.Gradient.linear(const Offset(50, 0), const Offset(60, 50), [const Color(0xff1c5cb7), const Color(0xff104896)]);

    var dotedCircle = Paint()
      ..strokeWidth = 2//0.3
      ..style = PaintingStyle.stroke
      ..color = const Color(0xffffffff);

    var secHandBrush = Paint()
      ..color = const Color(0xffffffff)
      ..style = PaintingStyle.stroke
     // ..strokeCap = StrokeCap.round
      ..strokeWidth = 30;
     

   // Animate smoothly with easing.
   // var msecs = Curves.easeInOut.transform(dateTime.millisecond / 1000);
    var msecs = 2 * pi / 60;
    var timeAngle = (dateTime.second - 1) * (2 * pi / 60) + msecs - secSize / 2;
    timeAngle = timeAngle - pi / 2;

      
     var center = Offset(centerXs, centerYs);
     var rect = Rect.fromCenter(center: center, width: size.width / 1.2, height: size.height / 1.2);
     


    canvas.translate(size.width / 2, size.height / 2);
     
    canvas.drawCircle(const Offset(0, 0), radius, solidCircle);
    canvas.drawCircle(const Offset(0, 0), radiusInnerClock, backgroundCircleInnerClock);
   
     canvas.drawArc(rect, timeAngle, secSize, false, secHandBrush);


  
    const double centerX = 0.0;
    const double centerY = 0.0;
    const double filledCircleRadius = 0.3;
    const int numberOfDots = 50;
    const double radiantStep = 5 * pi / numberOfDots;
   
    
    for (int i = 0; i < numberOfDots; i++) {
      canvas.drawCircle(
        
        Offset(centerX + sin(i * radiantStep) * radius / 1.3,
            centerY + cos(i * radiantStep) * radius / 1.3),
        filledCircleRadius,
        dotedCircle,
      );
    }

  }

  @override
  bool shouldRepaint(PaintClockWidget oldDelegate) {
    return true;
  }
}
