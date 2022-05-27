import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../constants/constants.dart';

class AlertTimeWidget extends StatelessWidget {
  const AlertTimeWidget({
    Key? key,
    required this.beginTimeController,
    required this.hintTimeText,
  }) : super(key: key);

  final TextEditingController beginTimeController;
  final String hintTimeText;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 5.0),
      width: 60.0,
      child: TextField(
        controller: beginTimeController,
        keyboardType: TextInputType.number,
        inputFormatters: [
          FilteringTextInputFormatter.digitsOnly,
          FilteringTextInputFormatter.allow(RegExp(r'[1-2]')),
        ],
        maxLength: 2,
        decoration: InputDecoration(
          hintText: hintTimeText,
          counter: const Offstage(),
          filled: true,
          fillColor: const Color(0xFFe9f5f9),
          hintStyle:  kCardsWidgetSecondTextStyle.copyWith(
            color: Colors.black, fontSize: 10
            ),
          border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.zero),
              borderSide: BorderSide.none),
        ),
      ),
    );
  }
}
