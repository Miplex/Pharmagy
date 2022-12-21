import 'package:pharmagy/data/model/appointment_data.dart';

class AppointmentDataService {
  AppointmentData _appointmentData =  AppointmentData(
      firstName: 'John',
      lastName: 'Smit',
      beginTimeHour: '08',
      beginTimeMinute: '30',
      endTimeHour: '20',
      endTimeMinute: '00',
      appoinment: 'appointment');

  AppointmentData get getAppointment => _appointmentData;
  List<AppointmentData> itemCard = [];
  AppointmentData setAppointment(
    final String firstName,
    final String lastName,
    final String beginTimeHour,
    final String beginTimeMinute,
    final String endTimeHour,
    final String endTimeMinute,
    final String appoinment,
    final int totalPatient,
    final int countBadges,
  ) =>
      _appointmentData = _appointmentData.copyWith(
          firstName: firstName,
          lastName: lastName,
          beginTimeHour: beginTimeHour,
          beginTimeMinute: beginTimeMinute,
          endTimeHour: endTimeHour,
          endTimeMinute: endTimeMinute,
          totalPatient: totalPatient,
          countBadges: countBadges,
          appoinment: appoinment);

}
