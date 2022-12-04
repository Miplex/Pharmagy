import 'package:equatable/equatable.dart';
import 'package:uuid/uuid.dart';

class AppointmentData extends Equatable {
  final String id;
  final String firstName;
  final String lastName;
  final String beginTimeHour;
  final String beginTimeMinute;
  final String endTimeHour;
  final String endTimeMinute;
  final String appoinment;
 

   AppointmentData(
      {
      String? id,
      required this.firstName,
      required this.lastName,
      required this.beginTimeHour,
      required this.beginTimeMinute,
      required this.endTimeHour,
      required this.endTimeMinute,
      required this.appoinment}) : assert (
        id == null || id.isNotEmpty,
      ),
      id = id ?? const Uuid().v4();

  AppointmentData copyWith({
    String? firstName,
    String? lastName,
    String? beginTimeHour,
    String? beginTimeMinute,
    String? endTimeHour,
    String? endTimeMinute,
    String? appoinment,
    String? id,
  }) =>
      AppointmentData(
          id: id ?? this.id,
          firstName: firstName ?? this.firstName,
          lastName: lastName ?? this.lastName,
          beginTimeHour: beginTimeHour ?? this.beginTimeHour,
          beginTimeMinute: beginTimeMinute ?? this.beginTimeMinute,
          endTimeHour: endTimeHour ?? this.endTimeHour,
          endTimeMinute: endTimeMinute ?? this.endTimeMinute,
          appoinment: appoinment ?? this.appoinment);

  @override
  List<Object?> get props => [
        id,
        firstName,
        lastName,
        beginTimeHour,
        beginTimeMinute,
        endTimeHour,
        endTimeMinute,
        appoinment,
      ];
}
