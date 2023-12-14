import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pharmagy/screens/home_screen/widgets/paint_line/paint_line_dotted_widget.dart';
import 'package:pharmagy/screens/home_screen/widgets/schedule_appointment_widget/circle_widget.dart';

class MScheduleAppointmentWidget extends StatelessWidget {
  MScheduleAppointmentWidget({Key? key}) : super(key: key);

  final ScrollController controller = ScrollController();

  final int beginHour = 7;
  final int beginMinute = 30;
  final int beginSecond = 0;
  final int endHour = 19;
  final int endMinute = 0;
  final int endSecond = 0;
  final int interval = 30;

  final int t = 660; //660

  final DateTime now = DateTime.now();
  final List<String> timeSlots = [];

  void tInit() {
    DateTime beginTime = DateTime(now.year, now.month, now.day, beginHour, beginMinute, beginSecond);
    DateTime endTime = DateTime(now.year, now.month, now.day, endHour, endMinute, endSecond);
    Duration step = Duration(minutes: interval);

    while (beginTime.isBefore(endTime)) {
      DateTime timeIncrement = beginTime.add(step);
      timeSlots.add(DateFormat.Hm().format(timeIncrement));
      beginTime = timeIncrement;
    }
  }

  @override
  Widget build(BuildContext context) {
    tInit();

    final currentTime = TimeOfDay.now();

    double upperHeight = 0.0;
    double lowerHeight = 0.0;

    const int startHour = 8;
    const int endHour = 19;

    // temporary implementation !!!
    if (currentTime.hour < startHour || currentTime.hour >= endHour) {
      // If the current time is not in the range from 8:00 to 19:00, set the heights of the containers to 0
      upperHeight = 0.0;
      lowerHeight = 0.0;
    } else {
      // We calculate container heights only for the time range from 8:00 to 19:00
      final int currentMinutes = currentTime.hour * 60 + currentTime.minute;
      const int startMinutes = startHour * 60;
      const int endMinutes = endHour * 60;

      final double screenHeight = MediaQuery.of(context).size.height;
      final double fullHeight = screenHeight - MediaQuery.of(context).padding.top;

      final double newUpperHeight = ((currentMinutes - startMinutes) / (endMinutes - startMinutes)) * fullHeight;
      final double newLowerHeight = fullHeight - newUpperHeight;

      upperHeight = newUpperHeight;
      lowerHeight = newLowerHeight;
    }

    List<Widget> timeLabels = [];

    for (int i = 8 * 60; i <= 19 * 60; i += 30) {
      timeLabels.add(
        Container(
          height: 33.5,
          alignment: Alignment.topCenter,
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Text(
            '${(i ~/ 60).toString().padLeft(2, '0')}:${(i % 60).toString().padLeft(2, '0')}',
            style: const TextStyle(fontSize: 16),
          ),
        ),
      );
      // timeLabels.add(Divider());
    }

    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            height: 50,
            // color: Colors.amber,
          ),
          Stack(
            children: [
              Stack(
                children: [
                  Column(
                    children: [
                      Stack(
                        children: [
                          Container(
                            height: upperHeight,
                            color: Colors.white,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 100),
                            child: CustomPaint(
                              painter: PaintLineDottedWidget(
                                sizeLine:
                                    upperHeight, //(timeSlots.length - (timeSlots.length - curentPos)) * detalized,
                                strokeWidth: 1.0, height: 0, width: 0,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 100),
                        child: Container(
                          height: lowerHeight,
                          color: Colors.blue,
                        ),
                      ),
                    ],
                  ),
                  Container(
                    width: 100,
                    height: upperHeight + lowerHeight,
                    child: ListView(
                      children: timeLabels,
                    ),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: upperHeight >= 7 ? upperHeight - 7 : upperHeight,
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 93),
                    child: CircleWidget(
                      heightBoxShadow: 14.0,
                      widthBoxShadow: 14.0,
                      heightBoxBack: 14.0,
                      widthBoxBack: 14.0,
                      heightBoxFront: 8.0,
                      widthBoxFront: 8.0,
                      alignment: Alignment.center,
                    ),
                  ),
                ],
              ),
            ],
          ),
          Container(
            height: 20,
            // color: Colors.amber,
          ),
        ],
      ),
    );
  }
}
