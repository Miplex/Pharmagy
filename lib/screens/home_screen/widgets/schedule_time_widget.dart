import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ScheduleTimeWidget extends StatelessWidget {
  ScheduleTimeWidget({Key? key}) : super(key: key);

//  DateFormat now = DateFormat('HH:mm');


  DateTime now = DateTime.now();


  List<String> timeSlots = [];


  @override
  Widget build(BuildContext context) {

    DateTime startTime = DateTime(now.year, now.month, now.day, 8, 0, 0);
    DateTime endTime = DateTime(now.year, now.month, now.day, 22, 0, 0);
    Duration step = const Duration(minutes: 30);

    while(startTime.isBefore(endTime)) {

      DateTime timeIncrement = startTime.add(step);
      timeSlots.add(DateFormat.Hm().format(timeIncrement));
      startTime = timeIncrement;
      print(startTime.toString());
    }


    return SizedBox(
      height: 400.0,
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
          // [
          //   Text(
          //     timeSlots.toString(),
          //     style: const TextStyle(
          //         color: Color(0xffB0BED4),
          //         fontSize: 16,
          //         fontFamily: 'NeutrifPro',
          //         height: 1.41),
          //   ),
          //   const SizedBox(
          //     height: 20.0,
          //   ),
          //   // Text('8:30', style:  TextStyle(color: Color(0xffB0BED4), fontSize: 12, fontFamily: 'NeutrifPro',height: 1.41),),
          //   // SizedBox(height: 23.0,),
          // ],
        );
      }),
    );
  }
}
