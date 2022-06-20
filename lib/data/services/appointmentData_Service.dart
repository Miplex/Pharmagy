import 'package:pharmagy/data/model/appointment_data.dart';

class AppointmentDataService {
   AppointmentData _appointmentData =  AppointmentData(
      firstName: 'John',
      lastName: 'Smit',
      beginTimeHour: '08',
      beginTameMinute: '30',
      endTmeHour: '20',
      endTimeMinute: '00',
      appoinment: 'aapointment');

  AppointmentData get getAppointment => _appointmentData;

  setAppointment(
          final String firstName,
          final String lastName,
          final String beginTimeHour,
          final String beginTameMinute,
          final String endTmeHour,
          final String endTimeMinute,
          final String appoinment) =>
      _appointmentData = _appointmentData.copyWith(
          firstName: firstName,
          lastName: lastName,
          beginTimeHour: beginTimeHour,
          endTmeHour: endTmeHour,
          endTimeMinute: endTimeMinute,
          appoinment: appoinment);
}
