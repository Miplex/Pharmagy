import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pharmagy/constants/constants.dart';
//import 'package:pharmagy/data/model/appointment_data.dart';
import 'package:pharmagy/locator.dart';
import 'package:pharmagy/data/services/appointment_data_service.dart';
// import 'package:pharmagy/screens/home_screen/widgets/list_card/list_card_widget.dart';
//import 'alert/alertTimeWidget.dart';
//import './list_card/list_card_widget.dart';

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
  //List<AppointmentData> item = [];
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
        )
        .copyWith(
          firstName: firstNameController.text,
          lastName: lastNameController.text,
          beginTimeHour: beginHourController.text,
          beginTimeMinute: beginMinuteController.text,
          endTimeHour: endHourController.text,
          endTimeMinute: endMinuteController.text,
          appoinment: dataDropDownValue,
        );
    _appDataService.itemCard.add(_appDataService.getAppointment);
    firstNameController.text = '';
    lastNameController.text = '';
    beginHourController.text = '';
    beginMinuteController.text = '';
    endHourController.text = '';
    endMinuteController.text = '';
    // dataDropDownValue = 'appointment';
    // //itemCard.add(1);
    // item.add(_appDataService.getAppointment);
    // print(item);
    // for (var item in _appDataService.itemCard) {
    //   print(item);
    // }
    // print(_appDataService.itemCard);
    //print(_appDataService.itemCard.length);

    // Navigator.push(
    //     context,
    //     MaterialPageRoute(
    //       builder: (context) => const HomeScreenWidget(
    //           // firstName: _appDataService.getAppointment.firstName,
    //           // lastName: _appDataService.getAppointment.lastName,
    //           // beginTimeHour: _appDataService.getAppointment.beginTimeHour,
    //           // beginTimeMinute: _appDataService.getAppointment.beginTimeMinute,
    //           // endTimeHour: _appDataService.getAppointment.endTimeHour,
    //           // endTimeMinute: _appDataService.getAppointment.endTimeMinute,
    //           // appointment: _appDataService.getAppointment.appoinment,
    //           ),
    //     ));

    //print(_appDataService.getAppointment);
    // _appDataService.setAppointment(
    //   _appDataService.getAppointment.firstName = firstNameController.text,
    //   _appDataService.getAppointment.lastName = lastNameController.text,
    //   _appDataService.getAppointment.beginTimeHour = beginHourController.text,
    //   _appDataService.getAppointment.beginTimeMinute = beginHourController.text,
    //   _appDataService.getAppointment.endTimeHour = endHourController.text,
    //   _appDataService.getAppointment.endTimeMinute = endMinuteController.text,
    //   _appDataService.getAppointment.appoinment = dataDropDownValue,
    // );
    // print(_time.hourText);
    // print(_time.minuteText);
    // print(_appDataService.getAppointment);
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

    void minuteAlertTime(String minute, BuildContext context) {
      if (minute.isNotEmpty) {
        final minuteDigit = int.parse(minute);
        if (minuteDigit <= 59 && minute.length == 2) {
          FocusScope.of(context).nextFocus();
        } else if (minuteDigit > 59 && minute.length == 2) {
          beginMinuteController.text = '59';

          FocusScope.of(context).nextFocus();
        }
      } else if (minute.isEmpty) {
        FocusScope.of(context).previousFocus();
      }
    }

    void hourAlertTime(String hour, BuildContext context) {
      if (hour.isNotEmpty) {
        final hourDigit = int.parse(hour);
        if (hourDigit <= 23 && hour.length == 2) {
          FocusScope.of(context).nextFocus();
        } else if (hourDigit > 23 && hour.length == 2) {
          beginHourController.text = '23';
          FocusScope.of(context).nextFocus();
        }
      } else if (hour.isEmpty) {
        FocusScope.of(context).previousFocus();
      }
    }

    //AlertTimeWidget _time = AlertTimeWidget();
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
                    Row(
                      children: [
                        // AlertTimeWidget(),
                        // AlertTimeWidget(),

                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 5.0),
                          width: 60.0,
                          child: TextFormField(
                            textAlign: TextAlign.center,
                            controller: beginHourController,
                            keyboardType: TextInputType.number,
                            autofocus: true,
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly,
                            ],
                            onChanged: (String hour) {
                              hourAlertTime(hour, context);
                            },
                            maxLength: 2,
                            style: const TextStyle(fontSize: 20.0),
                            decoration: const InputDecoration(
                              hintText: '00',
                              hintStyle: TextStyle(
                                  fontSize: 20.0, color: Colors.black),
                              counter: Offstage(),
                              filled: true,
                              fillColor: Color(0xFFe9f5f9),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(Radius.zero),
                                  borderSide: BorderSide.none),
                            ),
                          ),
                        ),
                        const Text(
                          ':',
                          style: TextStyle(fontSize: 22),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 5.0),
                          width: 60.0,
                          child: TextFormField(
                            textAlign: TextAlign.center,
                            controller: beginMinuteController,
                            keyboardType: TextInputType.number,
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly,
                            ],
                            onChanged: (String minute) {
                              minuteAlertTime(minute, context);
                            },
                            maxLength: 2,
                            style: const TextStyle(fontSize: 20.0),
                            decoration: const InputDecoration(
                              hintText: '00',
                              hintStyle: TextStyle(
                                  fontSize: 20.0, color: Colors.black),
                              counter: Offstage(),
                              filled: true,
                              fillColor: Color(0xFFe9f5f9),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(Radius.zero),
                                  borderSide: BorderSide.none),
                            ),
                          ),
                        ),

                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 5.0),
                          width: 60.0,
                          child: TextFormField(
                            textAlign: TextAlign.center,
                            controller: endHourController,
                            keyboardType: TextInputType.number,
                            autofocus: true,
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly,
                            ],
                            onChanged: (String hour) {
                              hourAlertTime(hour, context);
                            },
                            maxLength: 2,
                            style: const TextStyle(fontSize: 20.0),
                            decoration: const InputDecoration(
                              hintText: '00',
                              hintStyle: TextStyle(
                                  fontSize: 20.0, color: Colors.black),
                              counter: Offstage(),
                              filled: true,
                              fillColor: Color(0xFFe9f5f9),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(Radius.zero),
                                  borderSide: BorderSide.none),
                            ),
                          ),
                        ),
                        const Text(
                          ':',
                          style: TextStyle(fontSize: 22),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 5.0),
                          width: 60.0,
                          child: TextFormField(
                            textAlign: TextAlign.center,
                            controller: endMinuteController,
                            keyboardType: TextInputType.number,
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly,
                            ],
                            onChanged: (String minute) {
                              minuteAlertTime(minute, context);
                            },
                            maxLength: 2,
                            style: const TextStyle(fontSize: 20.0),
                            decoration: const InputDecoration(
                              hintText: '00',
                              hintStyle: TextStyle(
                                  fontSize: 20.0, color: Colors.black),
                              counter: Offstage(),
                              filled: true,
                              fillColor: Color(0xFFe9f5f9),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(Radius.zero),
                                  borderSide: BorderSide.none),
                            ),
                          ),
                        ),
                      ],
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

                      // print(appData.appoinment);
                    });
                  },
                ),
                Row(
                  children: [
                    TextButton(
                      onPressed: () {
                        _addDataModal(context);
                      },
                      child: Text('Done',
                          style: kCardsWidgetSecondTextStyle.copyWith(
                              fontSize: 16, color: Colors.blueAccent)),
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
