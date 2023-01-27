import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmagy/screens/home_screen/widgets/list_card/list_card_widget.dart';
import 'package:pharmagy/screens/home_screen/widgets/paint_line/paint_line_dotted_widget.dart';
import 'package:pharmagy/screens/home_screen/widgets/paint_line/paint_line_solid_widget.dart';
import 'package:pharmagy/screens/home_screen/widgets/schedule_appointment_widget/bloc/shedule_appointment_bloc.dart';
import 'package:pharmagy/screens/home_screen/widgets/schedule_appointment_widget/circle_widget.dart';
import 'package:pharmagy/screens/home_screen/widgets/schedule_time_widget.dart';
import 'package:pharmagy/screens/home_screen/widgets/schedule_appointment_widget/paint_rect_widget.dart';
import 'package:pharmagy/constants/constants.dart';


class ScheduleAppointmentWidget extends StatelessWidget {
  ScheduleAppointmentWidget({Key? key}) : super(key: key);

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
                  top: 155,
                  width: media.size.width,
                  height: media.size.height),
            ),
            Positioned(
              left: 87.0,
              top: 68.0,
              child: CustomPaint(
                painter:
                    PaintLineDottedWidget(sizeLine: 100.0, strokeWidth: 1.0),
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
              top: 150.0,
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
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 20.0, horizontal: 25.0),
                  child: Row(
                    children: const [
                      Text('Time',
                          style: TextStyle(
                            color: Color(0xff2a2d36),
                            fontSize: 12,
                            fontFamily: 'NeutrifPro',
                          )),
                      SizedBox(
                        width: 45.0,
                      ),
                      Text('Events',
                          style: TextStyle(
                            color: Color(0xff2a2d36),
                            fontSize: 12,
                            fontFamily: 'NeutrifPro',
                            height: 1.41,
                          )),
                    ],
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SingleChildScrollView(
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 70.0,
                      ),
                      ScheduleTimeWidget(
                        beginHour: 7,
                        beginMinute: 30,
                        beginSecond: 0,
                        endHour: 19,
                        endMinute: 0,
                        endSecond: 0,
                        interval: 30,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 15.0),
                  child: SizedBox(
                    width: 270.0,
                    height: media.size.height / 2,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 32.0),
                      child: BlocBuilder<SheduleAppointmentBloc, SheduleAppointmentState>(
                        builder: (context, state) {
                          if (state is ShdeduleListCardState) {
                            return ListView.builder(
                                controller: controller,
                                itemCount: 1,
                                itemBuilder: (BuildContext context, int index) {
                                  return Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children:  [
                                     for(final item in state.allItemsCard)
                                      ListCardWidget(
                                        firstName: item.firstName,
                                        lastName:  item.lastName,
                                        beginTimeHour:   item.beginTimeHour,
                                        beginTimeMinute: item.beginTimeMinute,
                                        endTimeHour:   item.endTimeHour,
                                        endTimeMinute: item.endTimeMinute,
                                        appointment:   item.appoinment,
                                      ),
                                    ],
                                  );
                                });
                          }
                          return Container();
                        },
                      ),
                    ),
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
