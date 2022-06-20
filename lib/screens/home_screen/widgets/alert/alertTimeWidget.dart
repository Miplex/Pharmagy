import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../../constants/constants.dart';

class AlertTimeWidget extends StatelessWidget {
  AlertTimeWidget({
    Key? key,
  }) : super(key: key);

  final hourController = TextEditingController();
  final minuteController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 5.0),
              width: 60.0,
              child: TextFormField(
                textAlign: TextAlign.center,
                controller: hourController,
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
                  hintStyle: TextStyle(fontSize: 20.0, color: Colors.black),
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
                controller: minuteController,
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
                  hintStyle: TextStyle(fontSize: 20.0, color: Colors.black),
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
        SizedBox(
          width: 115.0,
          child: Row(
            children: [
              Text(
                'Hour',
                style: kCardsWidgetSecondTextStyle.copyWith(
                    fontSize: 10.0, color: Colors.black),
              ),
              const SizedBox(width: 45.0),
              Text(
                'Minute',
                style: kCardsWidgetSecondTextStyle.copyWith(
                    fontSize: 10.0, color: Colors.black),
              ),
            ],
          ),
        ),
      ],
    );
  }

  void minuteAlertTime(String minute, BuildContext context) {
    if (minute.isNotEmpty) {
      final minuteDigit = int.parse(minute);
      if (minuteDigit <= 59 && minute.length == 2) {
        FocusScope.of(context).nextFocus();
      } else if (minuteDigit > 59 && minute.length == 2) {
        minuteController.text = '59';
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
        hourController.text = '23';
        FocusScope.of(context).nextFocus();
      }
    } else if (hour.isEmpty) {
      FocusScope.of(context).previousFocus();
    }
  }
}
