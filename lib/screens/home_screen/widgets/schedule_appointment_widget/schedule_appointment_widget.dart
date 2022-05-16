import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pharmagy/screens/home_screen/widgets/list_card_widget.dart';
import 'package:pharmagy/screens/home_screen/widgets/paint_line_dotted_widget.dart';
import 'package:pharmagy/screens/home_screen/widgets/paint_line_solid_widget.dart';
import 'package:pharmagy/screens/home_screen/widgets/schedule_appointment_widget/circle_widget.dart';
import 'package:pharmagy/screens/home_screen/widgets/schedule_time_widget.dart';
import 'package:pharmagy/screens/home_screen/widgets/schedule_appointment_widget/paint_rect_widget.dart';
import 'package:pharmagy/constants/constants.dart';

class ScheduleAppointmentWidget extends StatelessWidget {
  ScheduleAppointmentWidget({Key? key, required this.items}) : super(key: key);
  final List<String> items;
  final ScrollController controller = ScrollController();
  @override
  Widget build(BuildContext context) {
    MediaQueryData media = MediaQuery.of(context);
    return Expanded(
      child: DecoratedBox(
        decoration: const BoxDecoration(gradient: kTimeLineBackground),
        child: Stack(
          children: [
            CustomPaint(
              painter: PaintRectWidget(
                  left: 87.0,
                  top: 105.0,
                  width: media.size.width,
                  height: media.size.height),
            ),
            Positioned(
              left: 87.0,
              top: 68.0,
              child: CustomPaint(
                painter:
                    PaintLineDottedWidget(sizeLine: 30.0, strokeWidth: 1.0),
              ),
            ),
            Positioned(
              left: 87.0,
              top: 95.0,
              child: CustomPaint(
                painter:
                    PaintLineSolidWidget(sizeLine: media.size.height / 2.5),
              ),
            ),
            const Positioned(
              left: 80.0,
              top: 97.0,
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
            Column(
              //crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // PainterWidget(),
                Row(
                  children: const [
                    Padding(
                      padding: EdgeInsets.only(left: 35.0, top: 34.0),
                      child: Text('Time',
                          style: TextStyle(
                              color: Color(0xff2a2d36),
                              fontSize: 12,
                              fontFamily: 'NeutrifPro',
                              height: 1.41)),
                    ),
                    SizedBox(
                      width: 45.0,
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 34.0),
                      child: Text('Events',
                          style: TextStyle(
                            color: Color(0xff2a2d36),
                            fontSize: 12,
                            fontFamily: 'NeutrifPro',
                            height: 1.41,
                          )),
                    ),
                  ],
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SingleChildScrollView(
                  child: Column(
                    children: [
                      const SizedBox(height: 55.0,),
                      ScheduleTimeWidget(),
                    ],
                  ),
                ),
                SizedBox(
                  width: 294.0,
                  height: media.size.height / 2,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 18.0),
                    child: ListView.builder(
                        controller: controller,
                        itemCount: items.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ListCardWidget(),
                              // ListCardWidgetCurrently(),
                              //  ListCardWidgetInactive(),
                            ],
                          );
                        }),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
