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
  final String appointment;

  @HiveField(8)
  final int countBadges = 0;

  

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
      required this.appointment,
       })
      : assert(
          id == null || id.isNotEmpty,
        ),
        id = id ?? const Uuid().v4();

}
