import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pharmagy/widgets/schedule_time_widget.dart';

import '../constants.dart';

class ScheduleAppointmentWidget extends StatelessWidget {
   ScheduleAppointmentWidget({Key? key}) : super(key: key);
  final List<String> items = <String> ['1', '2','3','4'];
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 359,
      child: ListView.builder(
          itemCount: items.length,
          itemBuilder: (BuildContext context, int index){
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const ScheduleTimeWidget(),
                Column(
                  children: [
                    SizedBox(
                      width: 240,
                      height: 76,
                      child: Card(shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
                      ),
                        color: Colors.white,
                        child: Row(
                          children: [
                          Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 10.0),
                              child: IconButton(onPressed: (){}, icon: SvgPicture.asset('assets/images/icons/anesthesia_oval.svg',width: 30,height: 30,)),
                              // Icon(Icons.circle, color: Color.fromRGBO(212, 230, 255, 100),size: 30,),
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text('Francisco Elliott',style: TextStyle(color: Color(0xff404d66),fontSize: 12,fontFamily: 'NeutrifProMedium'),),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: const[
                                    Padding(
                                      padding: EdgeInsets.symmetric(horizontal: 3, vertical: 8 ),
                                      child: Icon(Icons.circle, color: Color(0xff8193ae),size: 10.89,),
                                    ),
                                    Text('8:30 AM - 02:00 PM',style: TextStyle(color: Color(0xff8193ae),fontSize: 10),),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            );
          }
      ),
    );
  }
}
