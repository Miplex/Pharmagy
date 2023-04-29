import 'package:hive/hive.dart';
import 'package:pharmagy/data/model/appointment_data.dart';

// class AppointmentService {
//    Appointment _appointmentData = Appointment(
//       firstName: '',
//       lastName: '',
//       avatarIcon: 'avatarIcon',
//       ovalIcon: 'ovalIcon',
//       beginTimeHour: 'beginTimeHour',
//       beginTimeMinute: 'beginTimeMinute',
//       endTimeHour: 'endTimeHour',
//       endTimeMinute: 'endTimeMinute',
//       dropDownButton: []);

//   Appointment get getAppointment => _appointmentData;
// }

class AppointmentService {
  late Box<AppointmentData> _appointment;

  Future<void> init() async {
    Hive.registerAdapter(AppointmentDataAdapter());
    _appointment = await Hive.openBox<AppointmentData>('appointment_box');
  }

  List<AppointmentData> getAllAppointment() {
    final appointment = _appointment.values;
    return appointment.toList();
  }

  void addAppointment(
      final String firstName,
      final String lastName,
      final String beginTimeHour,
      final String beginTimeMinute,
      final String endTimeHour,
      final String endTimeMinute,
      final String appointment) {
    _appointment.add(AppointmentData(
        firstName: firstName,
        lastName: lastName,
        beginTimeHour: beginTimeHour,
        beginTimeMinute: beginTimeMinute,
        endTimeHour: endTimeHour,
        endTimeMinute: endTimeMinute,
        appoinment: appointment));
  }

  Future<void> deleteAppointment(final String id) async {
    final appointmentToRemove =
        _appointment.values.firstWhere((element) => element.id == id);
    await appointmentToRemove.delete();
  }

  Future<void> updateAppointment(
      final String id,
      final String firstName,
      final String lastName,
      final String beginTimeHour,
      final String beginTimeMinute,
      final String endTimeHour,
      final String endTimeMinute,
      final String appointment) async {
    final appointmentUpdate =
        _appointment.values.firstWhere((element) => element.id == id);
    final index = appointmentUpdate.id;
    await _appointment.put(
        index,
        AppointmentData(
            firstName: firstName,
            lastName: lastName,
            beginTimeHour: beginTimeHour,
            beginTimeMinute: beginTimeMinute,
            endTimeHour: endTimeHour,
            endTimeMinute: endTimeMinute,
            appoinment: appointment));
  }
}
