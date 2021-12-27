import 'package:flutter/cupertino.dart';

class ScheduleTimeWidget extends StatelessWidget {
  const ScheduleTimeWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        Text('8:00',style: TextStyle(color: Color(0xffB0BED4), fontSize: 12,fontFamily: 'NeutrifPro'),),
        SizedBox(height: 20),
        Text('8:30',style: TextStyle(color: Color(0xffB0BED4), fontSize: 12,fontFamily: 'NeutrifPro')),

      ],
    );
  }
}
