import 'package:flutter/material.dart';


class ScheduleTimeWidget extends StatelessWidget {
   const ScheduleTimeWidget({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: const [
            Text('8:00', style:  TextStyle(color: Color(0xffB0BED4), fontSize: 12, fontFamily: 'NeutrifPro',height: 1.41),),
            SizedBox(height: 20.0,),
            Text('8:30', style:  TextStyle(color: Color(0xffB0BED4), fontSize: 12, fontFamily: 'NeutrifPro',height: 1.41),),
            SizedBox(height: 23.0,),
          ],
    );
  }
}
