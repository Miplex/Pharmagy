import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
//import 'package:pharmagy/data/services/appointment_data_service.dart';
//import 'package:pharmagy/locator.dart';

class ListCardWidget extends StatelessWidget {
  const ListCardWidget({
    Key? key,
    required this.firstName,
    required this.lastName,
    required this.beginTimeHour,
    required this.beginTimeMinute,
    required this.endTimeHour,
    required this.endTimeMinute,
    required this.appointment,
  }) : super(key: key);
  final String firstName;
  final String lastName;
  final String beginTimeHour;
  final String beginTimeMinute;
  final String endTimeHour;
  final String endTimeMinute;
  final String appointment;

  // final AppointmentDataService _appDataService =
  //     locator<AppointmentDataService>();

  @override
  Widget build(BuildContext context) {

    String _iconAppointment = '';
    if(appointment == 'appointment'){
      _iconAppointment = 'assets/images/icons/appointment_2.svg';
    }else if(appointment == 'anesthesia'){
      _iconAppointment = 'assets/images/icons/anesthesia_oval.svg';
    }else if(appointment == 'mouthwash'){
      _iconAppointment = 'assets/images/icons/mounthwash_2.svg';
    }
    

    return SizedBox(
      width: 250,
      height: 80.0,
      child: GestureDetector(
        onLongPress: () {
          print(firstName);
        },
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
                      _iconAppointment,
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
                    '$firstName $lastName',
                    //'${_appDataService.getAppointment.firstName}  ${_appDataService.getAppointment.lastName}',
                    //'${item.firstName}  ${item.lastName}',
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
                        padding:
                            EdgeInsets.symmetric(horizontal: 3, vertical: 2),
                        child: Icon(
                          Icons.circle,
                          color: Color(0xff8193ae),
                          size: 10.89,
                        ),
                      ),
                      Text(
                        // '8:30 AM - 09:00 AM',
                        '$beginTimeHour : $beginTimeMinute - $endTimeHour : $endTimeMinute',
                        //'${_appDataService.getAppointment.beginTimeHour} : ${_appDataService.getAppointment.beginTimeMinute} - ${_appDataService.getAppointment.endTimeHour} : ${_appDataService.getAppointment.endTimeMinute}',
                        //'${item.beginTimeHour} : ${item.beginTimeMinute} - ${item.endTimeHour} : ${item.endTimeMinute}',
                        style: const TextStyle(
                            color: Color(0xff8193ae),
                            fontSize: 10,
                            height: 1.7),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
