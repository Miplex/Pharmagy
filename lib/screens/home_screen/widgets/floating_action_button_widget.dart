import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmagy/constants/constants.dart';
import 'package:pharmagy/screens/home_screen/bloc/home_screen_bloc.dart';
import 'package:pharmagy/screens/home_screen/widgets/schedule_appointment_widget/bloc/shedule_appointment_bloc.dart';

import 'timer_picker/timer_picker.dart';

class FloatingActionButtonWidget extends StatefulWidget {
  const FloatingActionButtonWidget({
    Key? key,
  }) : super(key: key);

  @override
  FloatingActionButtonState createState() => FloatingActionButtonState();
}

class FloatingActionButtonState extends State<FloatingActionButtonWidget> {
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();

  final beginHourController = TextEditingController();
  final beginMinuteController = TextEditingController();

  final endHourController = TextEditingController();
  final endMinuteController = TextEditingController();
  final officeController = TextEditingController();

  String dataDropDownValue = 'appointment';

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        gradient: kAddItemColor,
      ),
      child: Padding(
        padding: const EdgeInsets.all(18.0),
        child: SizedBox(
          height: 50,
          width: 50,
          child: FloatingActionButton(
          //  shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(50.0))),
            onPressed: () {
              //AlertDialog
              buildShowDialog(context);
            },
            backgroundColor: const Color(0xff3c94ff),
            child: const Icon(
              Icons.add,
              size: 30.0,
             // color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }

  Future<dynamic> buildShowDialog(BuildContext context) {
    final item = ['appointment', 'anesthesia', 'mouthwash'];
    return showDialog(
      context: context,
      builder: (context) => StatefulBuilder(builder: (context, setState) {
        return AlertDialog(
          title: Text(
            'Add appointment',
            textAlign: TextAlign.center,
            style: kCardsWidgetSecondTextStyle.copyWith(
                color: Colors.black, fontSize: 16),
          ),
          content: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                      vertical: 5.0, horizontal: 5.0),
                  child: TextField(
                    controller: firstNameController,
                    autofocus: true,
                    decoration: const InputDecoration(
                      hintText: 'First Name',
                      hintStyle: TextStyle(
                        fontSize: 12.0,
                      ),
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                      vertical: 5.0, horizontal: 5.0),
                  child: TextField(
                    controller: lastNameController,
                    decoration: const InputDecoration(
                      hintText: 'Last Name',
                      hintStyle: TextStyle(
                        fontSize: 12.0,
                      ),
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [                    
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Text(
                          'Begin  Time',
                          style: kCardsWidgetSecondTextStyle.copyWith(
                              color: Colors.black, fontSize: 14),
                        ),
                        Text(
                          'End  Time',
                          style: kCardsWidgetSecondTextStyle.copyWith(
                              color: Colors.black, fontSize: 14),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    CustomTimePicker(
                      beginHourController: beginHourController,
                      beginMinuteController: beginMinuteController,
                      endHourController: endHourController,
                      endMinuteController: endMinuteController,
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    
                  ],
                ),
                DropdownButton<String>(
                  items: item.map(buildMenuItem).toList(),
                  alignment: Alignment.centerRight,
                  value: dataDropDownValue,
                  onChanged: (String? value) {
                    setState(() {
                      dataDropDownValue = value!;
                    });
                  },
                ),
                Row(
                  children: [
                    TextButton(
                      onPressed: () {
                        BlocProvider.of<HomeScreenBloc>(context).add(
                            AddAppointmentEvent(
                                firstNameController.text,
                                lastNameController.text,
                                beginHourController.text,
                                beginMinuteController.text,
                                endHourController.text,
                                endMinuteController.text,
                                dataDropDownValue));
                        //print(context);
                        BlocProvider.of<SheduleAppointmentBloc>(context)
                            .add(SheduleListCardEvent());

                        firstNameController.text = '';
                        lastNameController.text = '';
                        beginHourController.text = '';
                        beginMinuteController.text = '';
                        endHourController.text = '';
                        endMinuteController.text = '';
                        officeController.text = '';

                        Navigator.of(context).pop();
                      },
                      child: Text('Done',
                          style: kCardsWidgetSecondTextStyle.copyWith(
                              fontSize: 16, color: Colors.blueAccent)),
                    ),
                    // },
                    //  ),

                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text(
                        'Cancel',
                        style: kCardsWidgetSecondTextStyle.copyWith(
                            fontSize: 16, color: Colors.blueAccent),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      }),
    );
  }

  DropdownMenuItem<String> buildMenuItem(String item) => DropdownMenuItem(
        value: item,
        child: Text(
          item,
          style: kCardsWidgetSecondTextStyle.copyWith(
              color: Colors.black, fontSize: 13),
        ),
      );
}
