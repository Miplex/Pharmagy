import 'package:equatable/equatable.dart';

class AppointmentData extends Equatable {
  final String firstName;
  final String lastName;
  final String beginTimeHour;
  final String beginTimeMinute;
  final String endTimeHour;
  final String endTimeMinute;
  final String appoinment;

  const AppointmentData({
    required this.firstName,
    required this.lastName,
    required this.beginTimeHour,
    required this.beginTimeMinute,
    required this.endTimeHour,
    required this.endTimeMinute,
    required this.appoinment
  });

  AppointmentData copyWith({
    String? firstName,
    String? lastName,
    String? beginTimeHour,
    String? beginTimeMinute,
    String? endTimeHour,
    String? endTimeMinute,
    String? appoinment,
  }) =>
      AppointmentData(
        firstName: firstName ?? this.firstName,
        lastName: lastName ?? this.lastName,
        beginTimeHour: beginTimeHour ?? this.beginTimeHour,
        beginTimeMinute: beginTimeMinute ?? this.beginTimeMinute,
        endTimeHour: endTimeHour ?? this.endTimeHour,
        endTimeMinute: endTimeMinute ?? this.endTimeMinute,
        appoinment: appoinment ?? this.appoinment
      );

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
