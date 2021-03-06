import 'package:flutter/material.dart';


class CircleWidget extends StatelessWidget {
  const CircleWidget({
    Key? key,
    this.alignment = AlignmentDirectional.topStart,
    required this.heightBoxShadow,
    required this.widthBoxShadow,
    required this.heightBoxBack,
    required this.widthBoxBack,
    required this.heightBoxFront,
    required this.widthBoxFront,
  }) : super(key: key);

   final double heightBoxShadow;
   final double widthBoxShadow;
   final double heightBoxBack;
   final double widthBoxBack;
   final double heightBoxFront;
   final double widthBoxFront;
   final AlignmentGeometry alignment;
  @override
  Widget build(BuildContext context) {

    return Stack(
      alignment: alignment,
      children: [
        Container(
          height: heightBoxShadow,
          width: widthBoxShadow,
          //padding: const EdgeInsets.all(6.0),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withAlpha(90),
                offset: Offset.zero,
                blurRadius: 5.0,
                spreadRadius: 0.0,
              ),
            ],
          ),
        ),
        Container(
          height: heightBoxBack,
          width: widthBoxBack,
          // padding: const EdgeInsets.all(6.0),
          decoration: const BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
          ),
        ),
        Container(
          height: heightBoxFront,
          width: widthBoxFront,
          // padding: const EdgeInsets.all(4.0),
          decoration: const BoxDecoration(
            color: Colors.blueAccent,
            shape: BoxShape.circle,
          ),
        ),
      ],
    );
  }
}





