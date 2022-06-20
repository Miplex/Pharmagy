import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pharmagy/data/services/appointmentData_Service.dart';
import 'package:pharmagy/locator.dart';

class ListCardWidget extends StatelessWidget {
  ListCardWidget(
      {Key? key,
      this.firstName,
      this.lastName,
      this.beginTimeHour,
      this.beginTimeMinute,
      this.endTimeHour,
      this.endTimeMinute,
      this.appointment})
      : super(key: key);
  final String? firstName;
  final String? lastName;
  final String? beginTimeHour;
  final String? beginTimeMinute;
  final String? endTimeHour;
  final String? endTimeMinute;
  final String? appointment;

  final AppointmentDataService _appDataService =
      locator<AppointmentDataService>();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 250,
      height: 80.0,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        color: Colors.white,
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: IconButton(
                  onPressed: () {},
                  icon: SvgPicture.asset(
                    'assets/images/icons/anesthesia_oval.svg',
                    width: 30,
                    height: 30,
                  )),
              // Icon(Icons.circle, color: Color.fromRGBO(212, 230, 255, 100),size: 30,),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  // appointmentData.firstName,
                  '${_appDataService.getAppointment.firstName}  ${_appDataService.getAppointment.lastName}',
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
                      padding: EdgeInsets.symmetric(horizontal: 3, vertical: 2),
                      child: Icon(
                        Icons.circle,
                        color: Color(0xff8193ae),
                        size: 10.89,
                      ),
                    ),
                    Text(
                      // '8:30 AM - 09:00 AM',
                      '${_appDataService.getAppointment.beginTimeHour} : ${_appDataService.getAppointment.beginTameMinute} - ${_appDataService.getAppointment.endTmeHour} : ${_appDataService.getAppointment.endTimeMinute}',
                      style: const TextStyle(
                          color: Color(0xff8193ae), fontSize: 10, height: 1.7),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
