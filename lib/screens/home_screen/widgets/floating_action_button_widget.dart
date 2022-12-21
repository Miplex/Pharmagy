import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmagy/constants/constants.dart';
import 'package:pharmagy/locator.dart';
import 'package:pharmagy/data/services/appointment_data_service.dart';
import 'package:pharmagy/screens/home_screen/bloc/home_screen_bloc.dart';

import 'timer_picker/timer_picker.dart';

class FloatingActionButtonWidget extends StatefulWidget {
  const FloatingActionButtonWidget({
    Key? key,
  }) : super(key: key);

  @override
  _FloatingActionButtonState createState() => _FloatingActionButtonState();
}

class _FloatingActionButtonState extends State<FloatingActionButtonWidget> {


  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();

  final beginHourController = TextEditingController();
  final beginMinuteController = TextEditingController();

  final endHourController = TextEditingController();
  final endMinuteController = TextEditingController();

  final AppointmentDataService _appDataService =
      locator<AppointmentDataService>();

  String dataDropDownValue = 'appointment';

  void _addDataModal(BuildContext context) {
    Navigator.of(context).pop();


    _appDataService
        .setAppointment(
          firstNameController.text,
          lastNameController.text,
          beginHourController.text,
          beginMinuteController.text,
          endHourController.text,
          endMinuteController.text,
          dataDropDownValue,
          0,
          0,
        )
        .copyWith(
            firstName: firstNameController.text,
            lastName: lastNameController.text,
            beginTimeHour: beginHourController.text,
            beginTimeMinute: beginMinuteController.text,
            endTimeHour: endHourController.text,
            endTimeMinute: endMinuteController.text,
            appoinment: dataDropDownValue,
            totalPatient: 0,
            countBadges: 0);
    _appDataService.itemCard.add(_appDataService.getAppointment);
    firstNameController.text = '';
    lastNameController.text = '';
    beginHourController.text = '';
    beginMinuteController.text = '';
    endHourController.text = '';
    endMinuteController.text = '';
    //print(_appDataService.getAppointment.id);
  }

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        gradient: kAddItemColor,
      ),
      child: Padding(
        padding: const EdgeInsets.all(13.0),
        child: SizedBox(
          height: 30,
          width: 30,
          child: FloatingActionButton(
            onPressed: () {
              //AlertDialog
              buildShowDialog(context);
            },
            child: const Icon(
              Icons.add,
              size: 20.0,
            ),
            backgroundColor: const Color(0xff3c94ff),
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
                  children: [
                    const SizedBox(
                      height: 10.0,
                    ),
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
                    BlocBuilder<HomeScreenBloc, HomeListCardState>(
                      builder: (context, state) {
                        return TextButton(
                          onPressed: () {
                            var listCard = _appDataService.getAppointment;
                            // var listCard = AppointmentData(
                            //     firstName: firstNameController.text,
                            //     lastName: lastNameController.text,
                            //     beginTimeHour: beginHourController.text,
                            //     beginTimeMinute: beginMinuteController.text,
                            //     endTimeHour: endHourController.text,
                            //     endTimeMinute: endMinuteController.text,
                            //     appoinment: dataDropDownValue);

                               

                            _addDataModal(context);
                            context
                                .read<HomeScreenBloc>()
                                .add(HomeListCardEvent(
                                  listData: listCard,
                                ));

                              

                            print(listCard);
                          },
                          child: Text('Done',
                              style: kCardsWidgetSecondTextStyle.copyWith(
                                  fontSize: 16, color: Colors.blueAccent)),
                        );
                      },
                    ),
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


