import 'package:flutter/material.dart';

abstract class AppColor{
  static const kMainColor = LinearGradient(
    begin: Alignment.centerRight,
    end: Alignment.centerLeft,
    colors: <Color>[Color(0xff07377a), Color(0xff2266C7)]);
    }

const kMainColor = LinearGradient(
    begin: Alignment.centerRight,
    end: Alignment.centerLeft,
    colors: <Color>[Color(0xff07377a), Color(0xff2266C7)]);
const kSearchColor = Color(0xff3D8BFF);
const kCardColor = Color(0xff1b69c7);
const kAppointmentActiveColor = Color.fromRGBO(193, 216, 244, 41);
const kAddItemColor = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: <Color>[Color(0xffFFFFFF), Color(0xffE2E8F5)]);
const kBackgroundColorGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: <Color>[Color(0xffF8FBFF), Color(0xffE2E9F5)]);
const kCardsWidgetPrimaryTextStyle = TextStyle(
    color: Colors.white, fontFamily: 'NeutrifProMedium', fontSize: 12);
const kCardsWidgetSecondTextStyle =
    TextStyle(color: Colors.white, fontFamily: 'NeutrifPro', fontSize: 10);
const kTimeLineCycleBackground = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: <Color>[Color(0x69C1D8F4), Color(0x00C1D8F4)]);
const kTimeLineColor = Color(0xFF4076D5);
const kBackgroundTimeLineColor = Color(0xFFD8D8D8);
const kTimeLineBackground = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: <Color>[Color(0xFFF8FBFF), Color(0xFFE2E9F5)]);
const kTimeLineSolidColor = Color(0x4DB0BED4);
const kAvatarOvalColor = Color(0xFFFA3D3D);
const kClockBackgroundColor = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: <Color>[Color(0xff2064c5), Color(0xFF0C4492)]);
const kClockAppbarColor = Color.fromARGB(255, 44, 117, 218);
const kBackgroundColorClock = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: <Color>[Color.fromARGB(255, 13, 92, 203), Color.fromARGB(255, 14, 87, 190)]);
    const kClockColor = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: <Color>[Color(0xff144ea2), Color.fromARGB(255, 73, 123, 202)]);
