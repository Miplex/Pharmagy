part of 'shedule_appointment_bloc.dart';

abstract class SheduleAppointmentEvent extends Equatable {}

class SheduleListCardEvent extends SheduleAppointmentEvent {
  @override
  List<Object?> get props => [];
}

class SheduleAppointmentDeleteEvent extends SheduleAppointmentEvent {
  final String id;

  SheduleAppointmentDeleteEvent(this.id);

  @override
  List<Object?> get props => [id];
}

class SheduleAppointmentUpdateEvent extends SheduleAppointmentEvent {
  final String id;
  final String firstName;
  final String lastName;
  final String beginTimeHour;
  final String beginTimeMinute;
  final String endTimeHour;
  final String endTimeMinute;
  final String appointment;
  final String office;

  SheduleAppointmentUpdateEvent(
      this.id,
      this.firstName,
      this.lastName,
      this.beginTimeHour,
      this.beginTimeMinute,
      this.endTimeHour,
      this.endTimeMinute,
      this.appointment,
      this.office);

  @override
  List<Object?> get props => [
        id,
        firstName,
        lastName,
        beginTimeHour,
        beginTimeMinute,
        endTimeHour,
        endTimeMinute,
        office,
        appointment
      ];
}

// class RegisterServicesEvent extends SheduleAppointmentEvent {
//   @override
//   List<Object?> get props => [];
// }
