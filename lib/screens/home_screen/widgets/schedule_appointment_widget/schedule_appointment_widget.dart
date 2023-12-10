import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmagy/screens/home_screen/widgets/list_card/list_card_widget.dart';
import 'package:pharmagy/screens/home_screen/widgets/paint_line/paint_line_dotted_widget.dart';
//import 'package:pharmagy/screens/home_screen/widgets/paint_line/paint_line_solid_widget.dart';
import 'package:pharmagy/screens/home_screen/widgets/schedule_appointment_widget/bloc/shedule_appointment_bloc.dart';
//import 'package:pharmagy/screens/home_screen/widgets/schedule_appointment_widget/circle_widget.dart';
import 'package:pharmagy/screens/home_screen/widgets/schedule_time_widget.dart';
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
            // CustomPaint(
            //   painter: PaintRectWidget(
            //       left: 87.0,
            //       top: 155,
            //       width: media.size.width,
            //       height: media.size.height),
            // ),
            Positioned(
              left: 87.0,
              top: 68.0,
              child: CustomPaint(
                painter:
                    PaintLineDottedWidget(sizeLine: 80.0, strokeWidth: 1.5, width: media.size.width, height: media.size.height),
              ),
            ),
            // Positioned(
            //   left: 87.0,
            //   top: 170.0,
            //   child: CustomPaint(
            //     painter:
            //         PaintLineSolidWidget(sizeLine: media.size.height),
            //   ),
            // ),
             const Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: 20.0, horizontal: 25.0),
                  child: Row(
                    children: [
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
                Padding(
                  padding: const EdgeInsets.only(top: 80.0),
                  child: ScheduleTimeWidget(
                    beginHour: 7,
                    beginMinute: 30,
                    beginSecond: 0,
                    endHour: 19,
                    endMinute: 0,
                    endSecond: 0,
                    interval: 30,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 15.0),
                  child: SizedBox(
                    width: 270.0,
                    height: media.size.height / 2,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 32.0),
                      child: BlocBuilder<SheduleAppointmentBloc,
                          SheduleAppointmentState>(
                        builder: (context, state) {
                          if (state is SheduleListCardState) {
                            //print('SheduleListCardState');
                            //print(state.allItemsCard.length);
                            return ListView.builder(
                              controller: controller,
                              itemCount: state.allItemsCard.length,
                              itemBuilder: (BuildContext context, int index) {
                                // print(state.allItemsCard[index].office);
                                //  print(state.allItemsCard[index]);
                                return Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                  children: [
                                    ListCardWidget(
                                      currentTime: true,
                                      id: state
                                          .allItemsCard[index].id, 
                                      firstName: state.allItemsCard[index]
                                          .firstName, 
                                      lastName: state.allItemsCard[index]
                                          .lastName, 
                                      beginTimeHour: state.allItemsCard[index]
                                          .beginTimeHour, 
                                      beginTimeMinute: state
                                          .allItemsCard[index]
                                          .beginTimeMinute, 
                                      endTimeHour: state.allItemsCard[index]
                                          .endTimeHour, 
                                      endTimeMinute: state.allItemsCard[index]
                                          .endTimeMinute, 
                                      appointment: state.allItemsCard[index]
                                          .appointment, 
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



// CircleWidget(
//                 heightBoxShadow: 14.0,
//                 widthBoxShadow: 14.0,
//                 heightBoxBack: 14.0,
//                 widthBoxBack: 14.0,
//                 heightBoxFront: 8.0,
//                 widthBoxFront: 8.0,
//                 alignment: Alignment.center,
//               )