import 'package:hive/hive.dart';
import 'package:uuid/uuid.dart';

part 'appointment_data.g.dart';

@HiveType(typeId: 1)
class AppointmentData extends HiveObject{

  @HiveField(0)
  final String id;

  @HiveField(1)
  final String firstName;

 @HiveField(2)
  final String lastName;

 @HiveField(3)
  final String beginTimeHour;

  @HiveField(4)
  final String beginTimeMinute;

  @HiveField(5)
  final String endTimeHour;

  @HiveField(6)
  final String endTimeMinute;

  @HiveField(7)
  final String appoinment;

  @HiveField(8)
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

  // AppointmentData copyWith({
  //   String? id,
  //   String? firstName,
  //   String? lastName,
  //   String? beginTimeHour,
  //   String? beginTimeMinute,
  //   String? endTimeHour,
  //   String? endTimeMinute,
  //   String? appoinment,
  //   int? totalPatient,
  //   int? countBadges,
  // }) =>
  //     AppointmentData(
  //         id: id ?? this.id,
  //         firstName: firstName ?? this.firstName,
  //         lastName: lastName ?? this.lastName,
  //         beginTimeHour: beginTimeHour ?? this.beginTimeHour,
  //         beginTimeMinute: beginTimeMinute ?? this.beginTimeMinute,
  //         endTimeHour: endTimeHour ?? this.endTimeHour,
  //         endTimeMinute: endTimeMinute ?? this.endTimeMinute,
  //         countBadges: countBadges ?? this.countBadges,
  //         appoinment: appoinment ?? this.appoinment);

  // @override
  // List<Object?> get props => [
  //       id,
  //       firstName,
  //       lastName,
  //       beginTimeHour,
  //       beginTimeMinute,
  //       endTimeHour,
  //       endTimeMinute,
  //       appoinment,
  //       countBadges,
  //     ];
}
