import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
//import 'package:flutter/rendering.dart';
import 'package:pharmagy/locator.dart';
import 'package:pharmagy/screens/calendar_screen/calendar_screen_widget.dart';
import 'package:pharmagy/screens/clock_screen/clock_screen_widget.dart';
import 'package:pharmagy/screens/home_screen/bloc/home_screen_bloc.dart';
import 'package:pharmagy/screens/home_screen/home_screen_widget.dart';
import 'package:pharmagy/screens/profile_screen/profile_screen_widget.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized;
  setupLocator();
  await Hive.initFlutter();
  //debugRepaintRainbowEnabled = true;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeScreenBloc(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        routes: {
          '/': (context) => const HomeScreenWidget(),
          '/calendar': (context) => const CalendarScreenWidget(),
          '/clock': (context) => const ClockScreenWidget(),
          '/profile': (context) => const ProfileScreenWidget()
        },
      ),
    );
  }
}
