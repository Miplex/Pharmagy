import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ScheduleTimeWidget extends StatelessWidget {
  ScheduleTimeWidget({
      required this.beginHour,
      required this.beginMinute,
      required this.beginSecond,
      required this.interval,
      required this.endHour,
      required this.endMinute,
      required this.endSecond,
      Key? key}) : super(key: key);

//  DateFormat now = DateFormat('HH:mm');


  DateTime now = DateTime.now();
  List<String> timeSlots = [];

 final int beginHour;
 final int beginMinute;
 final int beginSecond;
 final int endHour;
 final int endMinute;
 final int endSecond;
 final int interval;



  @override
  Widget build(BuildContext context) {


    DateTime beginTime = DateTime(now.year, now.month, now.day, beginHour, beginMinute, beginSecond);
    DateTime endTime = DateTime(now.year, now.month, now.day, endHour, endMinute, endSecond);
    Duration step =  Duration(minutes: interval);

    while(beginTime.isBefore(endTime)) {

      DateTime timeIncrement = beginTime.add(step);
      timeSlots.add(DateFormat.Hm().format(timeIncrement));
      beginTime = timeIncrement;
     // print(beginTime.toString());
    }



    return SizedBox(
      height: 320.0,
      width: 90.0,
      child: ListView.builder(
        itemCount: 1,
        itemBuilder: (BuildContext context, int index) {
        return Column(
          children:
          timeSlots.map((time) {
          return SizedBox(
           child:   Text(
                time,
                style: const TextStyle(color: Color(0xffB0BED4),
                    fontSize: 16,
                    fontFamily: 'NeutrifPro',
                    height: 1.41)),
               height: 60.0,
          );

          }
          ).toList(),

        );
      }),
    );
  }
}
