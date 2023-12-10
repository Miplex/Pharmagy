import 'package:flutter/material.dart';

class SizeConfig {
  double screenWidth = 0.0;
  double screenHeight = 0.0;

  SizeConfig(BuildContext context) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    screenWidth = mediaQueryData.size.width;
    screenHeight = mediaQueryData.size.height;
  }
}
