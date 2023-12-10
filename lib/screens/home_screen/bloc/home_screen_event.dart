part of 'home_screen_bloc.dart';

abstract class HomeScreenEvent extends Equatable {
  const HomeScreenEvent();
  // @override
  // List<Object> get props => [];
}


class AddAppointmentEvent extends HomeScreenEvent {
  final String firstName;
  final String lastName;
  final String beginTimeHour;
  final String beginTimeMinute;
  final String endTimeHour;
  final String endTimeMinute;
  final String appoinment;

  const AddAppointmentEvent(
      this.firstName,
      this.lastName,
      this.beginTimeHour,
      this.beginTimeMinute,
      this.endTimeHour,
      this.endTimeMinute,
      this.appoinment,);
  @override
  List<Object?> get props => [
        firstName,
        lastName,
        beginTimeHour,
        beginTimeMinute,
        endTimeHour,
        endTimeMinute,
        appoinment,
      ];
}

class RegisterServicesEvent extends HomeScreenEvent {
  @override
  List<Object?> get props => [];
}

