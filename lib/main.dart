import 'package:flutter/material.dart';
import 'package:pharmagy/screens/calendar_screen/calendar_screen_widget.dart';
import 'package:pharmagy/screens/clock_screen/clock_screen_widget.dart';
import 'package:pharmagy/screens/home_screen/home_screen_widget.dart';
import 'package:pharmagy/screens/profile_screen/profile_screen_widget.dart';
import 'package:pharmagy/screens/schedule_scroll_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const HomeScreenWidget(),
        '/calendar': (context) => const  CalendarScreenWidget(),
        '/clock': (context) => const ClockScreenWidget(),
        '/profile': (context) => const ProfileScreenWidget()
      },
    );

  }
}


