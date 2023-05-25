import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:intl/intl.dart';
import 'package:pharmagy/data/model/appointment_data.dart';
import 'package:pharmagy/data/services/appointment_service.dart';
//import 'package:flutter/rendering.dart';
import 'package:pharmagy/locator.dart';
import 'package:pharmagy/screens/calendar_screen/calendar_screen_widget.dart';
import 'package:pharmagy/screens/clock_screen/clock_screen_widget.dart';
import 'package:pharmagy/screens/home_screen/bloc/home_screen_bloc.dart';
//import 'package:pharmagy/screens/home_screen/bloc/home_screen_bloc.dart';
import 'package:pharmagy/screens/home_screen/home_screen_widget.dart';
import 'package:pharmagy/screens/home_screen/widgets/schedule_appointment_widget/bloc/shedule_appointment_bloc.dart';
import 'package:pharmagy/screens/profile_screen/profile_screen_widget.dart';

import 'screens/clock_screen/cubit/clock_screen_cubit.dart';

//import 'data/model/appointment_data.dart';

//import 'data/model/appointment_data.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized;
  setupLocator();
  await Hive.initFlutter();
  //debugRepaintRainbowEnabled = true;
  // Hive.registerAdapter(AppointmentDataAdapter());
  // await Hive.openBox<AppointmentData>('appointment_box');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
   // final AppointmentService _appService;



    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(create: (context) => AppointmentService()),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => HomeScreenBloc(RepositoryProvider.of<AppointmentService>(context))),
          BlocProvider(create: (context) => SheduleAppointmentBloc(RepositoryProvider.of<AppointmentService>(context))),
          BlocProvider(create: (context) => ClockScreenCubit())
        ],
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
      ),
    );
  }
}
