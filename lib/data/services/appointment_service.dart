import 'package:pharmagy/data/model/appointment.dart';

class AppointmentService {
   Appointment _appointmentData = Appointment(
      firstName: '',
      lastName: '',
      avatarIcon: 'avatarIcon',
      ovalIcon: 'ovalIcon',
      beginTimeHour: 'beginTimeHour',
      beginTimeMinute: 'beginTimeMinute',
      endTimeHour: 'endTimeHour',
      endTimeMinute: 'endTimeMinute',
      dropDownButton: []);

  Appointment get getAppointment => _appointmentData;
}
