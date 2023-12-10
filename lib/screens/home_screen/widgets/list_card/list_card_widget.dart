import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pharmagy/screens/home_screen/widgets/schedule_appointment_widget/bloc/shedule_appointment_bloc.dart';

class ListCardWidget extends StatelessWidget {
  const ListCardWidget({
    Key? key,
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.beginTimeHour,
    required this.beginTimeMinute,
    required this.endTimeHour,
    required this.endTimeMinute,
    required this.appointment,
    this.currentTime,
  }) : super(key: key);
  final String id;
  final String firstName;
  final String lastName;
  final String beginTimeHour;
  final String beginTimeMinute;
  final String endTimeHour;
  final String endTimeMinute;
  final String appointment;
  final bool? currentTime;

  @override
  Widget build(BuildContext context) {
    // print(appointment);
    // print(office);
    String iconAppointment = '';
    if (appointment == 'appointment') {
      iconAppointment = 'assets/images/icons/appointment_2.svg';
    } else if (appointment == 'anesthesia') {
      iconAppointment = 'assets/images/icons/anesthesia_oval.svg';
    } else if (appointment == 'mouthwash') {
      iconAppointment = 'assets/images/icons/mounthwash_2.svg';
    }

    return SizedBox(
      width: 250,
      height: firstName == 'Rustem' ? 80.0 : 60,
      child: BlocBuilder<SheduleAppointmentBloc, SheduleAppointmentState>(
        builder: (context, state) {
          return GestureDetector(
            onLongPress: () {
              _showMyDialog(context);
            },
            child: DecoratedBox(
              decoration: const BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Color(0xffd6e2f6),
                    spreadRadius: 10.0,
                    blurRadius: 10.0,
                    offset: Offset(0.0, 20.0)
                  )
                ]
              ),
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                                                //Test
                                          //_____________________________________________________                        
                color:  Colors.white,   //firstName == 'Rustem' ? Colors.white : Colors.black87,
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: IconButton(
                          onPressed: () {},
                          icon: SvgPicture.asset(
                            iconAppointment,
                            width: 30,
                            height: 30,
                          )),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '$firstName $lastName',
                          style: const TextStyle(
                              color: Color(0xff404d66),
                              fontSize: 10,
                              fontFamily: 'NeutrifProMedium',
                              height: 1.41),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 3, vertical: 2),
                              child: Icon(
                                Icons.circle,
                                color: Color(0xff8193ae),
                                size: 10.89,
                              ),
                            ),
                            Text(
                              '$beginTimeHour : $beginTimeMinute - $endTimeHour : $endTimeMinute',
                              style: const TextStyle(
                                  color: Color(0xff8193ae),
                                  fontSize: 10,
                                  height: 1.7),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Future<void> _showMyDialog(context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Delete Appointment'),
          content: const SingleChildScrollView(
            child: ListBody(
              children: [
                Text('Would you like to delete appointment?'),
              ],
            ),
          ),
          actions: [
            TextButton(
              child: const Text('Delete'),
              onPressed: () {
                BlocProvider.of<SheduleAppointmentBloc>(context)
                    .add(SheduleAppointmentDeleteEvent(id));
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
