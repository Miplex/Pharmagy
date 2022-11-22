import 'package:pharmagy/data/model/appointment_data.dart';

class AppointmentDataService {
  AppointmentData _appointmentData = const AppointmentData(
      firstName: 'John',
      lastName: 'Smit',
      beginTimeHour: '08',
      beginTimeMinute: '30',
      endTimeHour: '20',
      endTimeMinute: '00',
      appoinment: 'appointment');
  List<AppointmentData> itemCard = [];
  AppointmentData get getAppointment => _appointmentData;

  AppointmentData setAppointment(
    final String firstName,
    final String lastName,
    final String beginTimeHour,
    final String beginTimeMinute,
    final String endTimeHour,
    final String endTimeMinute,
    final String appoinment,
  ) =>
      _appointmentData = _appointmentData.copyWith(
          firstName: firstName,
          lastName: lastName,
          beginTimeHour: beginTimeHour,
          beginTimeMinute: beginTimeMinute,
          endTimeHour: endTimeHour,
          endTimeMinute: endTimeMinute,
          appoinment: appoinment);

}
