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
  final int countBadges = 5;

  AppointmentData(
      {
      String? id,
      int? countBadges,
      required this.firstName,
      required this.lastName,
      required this.beginTimeHour,
      required this.beginTimeMinute,
      required this.endTimeHour,
      required this.endTimeMinute,
      required this.appoinment})
      : assert(
          id == null || id.isNotEmpty,
        ),
        id = id ?? const Uuid().v4();

  AppointmentData copyWith({
    String? id,
    String? firstName,
    String? lastName,
    String? beginTimeHour,
    String? beginTimeMinute,
    String? endTimeHour,
    String? endTimeMinute,
    String? appoinment,
    int? totalPatient,
    int? countBadges,
  }) =>
      AppointmentData(
          id: id ?? this.id,
          firstName: firstName ?? this.firstName,
          lastName: lastName ?? this.lastName,
          beginTimeHour: beginTimeHour ?? this.beginTimeHour,
          beginTimeMinute: beginTimeMinute ?? this.beginTimeMinute,
          endTimeHour: endTimeHour ?? this.endTimeHour,
          endTimeMinute: endTimeMinute ?? this.endTimeMinute,
          countBadges: countBadges ?? this.countBadges,
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
        countBadges,
      ];
}
