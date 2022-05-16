import 'package:flutter/material.dart';
import 'package:flutter_week_view/flutter_week_view.dart';

import 'package:pharmagy/constants/constants.dart';

class ClockScreenWidget extends StatelessWidget {
  const ClockScreenWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Clock'),
      ),
      body: Column(
        children:  [
         Expanded(
           child: DayView(
             date: now,
             minimumTime: HourMinute.fromDuration(duration: Duration(hours: 7)),
              maximumTime: HourMinute.fromDuration(duration: Duration(hours: 20, minutes: 01)),
             hoursColumnStyle: HoursColumnStyle(
                 decoration: BoxDecoration(gradient: kTimeLineCycleBackground),
               interval: Duration( minutes: 30)
             ),
         ),
         ),
        ],
      ),
    );
  }
}
