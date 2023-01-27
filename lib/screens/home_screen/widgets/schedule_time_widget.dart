import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ScheduleTimeWidget extends StatelessWidget {
  ScheduleTimeWidget(
      {required this.beginHour,
      required this.beginMinute,
      required this.beginSecond,
      required this.interval,
      required this.endHour,
      required this.endMinute,
      required this.endSecond,
      Key? key})
      : super(key: key);


  final DateTime now = DateTime.now();
  final List<String> timeSlots = [];

  final int beginHour;
  final int beginMinute;
  final int beginSecond;
  final int endHour;
  final int endMinute;
  final int endSecond;
  final int interval;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    DateTime beginTime = DateTime(
       now.year, now.month, now.day, beginHour, beginMinute, beginSecond);
    DateTime endTime =
        DateTime(now.year, now.month, now.day, endHour, endMinute, endSecond);
    Duration step = Duration(minutes: interval);

    while (beginTime.isBefore(endTime)) {
      DateTime timeIncrement = beginTime.add(step);
      timeSlots.add(DateFormat.Hm().format(timeIncrement));
      beginTime = timeIncrement;
    }

    return SizedBox(
      height: height,
      width: 90.0,
      child: ListView.builder(
          itemCount: 1,
          itemBuilder: (BuildContext context, int index) {
            return Column(
              children: timeSlots.map((time) {
                return SizedBox(
                  height: 50.0,
                  child: Text(time,
                      style: const TextStyle(
                          color: Color(0xffB0BED4),
                          fontSize: 12,
                          fontFamily: 'NeutrifPro',
                          height: 1.41)),
                );
              }).toList(),
            );
          }),
    );
  }
}
