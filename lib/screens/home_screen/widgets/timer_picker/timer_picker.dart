import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTimePicker extends StatelessWidget {
  const CustomTimePicker({
    Key? key,
    required this.beginHourController,
    required this.beginMinuteController,
    required this.endHourController,
    required this.endMinuteController,
  }) : super(key: key);

  final TextEditingController beginHourController;
  final TextEditingController beginMinuteController;
  final TextEditingController endHourController;
  final TextEditingController endMinuteController;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
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
              hourAlertTime(hour, context, beginHourController);
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
            controller: beginMinuteController,
            keyboardType: TextInputType.number,
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly,
            ],
            onChanged: (String minute) {
              minuteAlertTime(minute, context, beginMinuteController);
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
              hourAlertTime(hour, context, endHourController);
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
            controller: endMinuteController,
            keyboardType: TextInputType.number,
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly,
            ],
            onChanged: (String minute) {
              minuteAlertTime(minute, context, endMinuteController);
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
    );
  }
}

void minuteAlertTime(
    String minute, BuildContext context, TextEditingController controller) {
  if (minute.isNotEmpty) {
    final minuteDigit = int.parse(minute);
    if (minuteDigit <= 59 && minute.length == 2) {
      FocusScope.of(context).nextFocus();
    } else if (minuteDigit > 59 && minute.length == 2) {
      controller.text = '59';

      FocusScope.of(context).nextFocus();
    }
  } else if (minute.isEmpty) {
    FocusScope.of(context).previousFocus();
  }
}

void hourAlertTime(
    String hour, BuildContext context, TextEditingController controller) {
  if (hour.isNotEmpty) {
    final hourDigit = int.parse(hour);
    if (hourDigit <= 23 && hour.length == 2) {
      FocusScope.of(context).nextFocus();
    } else if (hourDigit > 23 && hour.length == 2) {
      controller.text = '23';
      FocusScope.of(context).nextFocus();
    }
  } else if (hour.isEmpty) {
    FocusScope.of(context).previousFocus();
  }
}
