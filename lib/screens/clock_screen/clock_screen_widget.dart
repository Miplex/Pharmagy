import 'package:flutter/material.dart';
import 'package:flutter_week_view/flutter_week_view.dart';

import '../constants.dart';

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
             hoursColumnStyle: HoursColumnStyle(decoration: BoxDecoration(gradient: kTimeLineCycleBackground)),
         ),
         ),
        ],
      ),
    );
  }
}
