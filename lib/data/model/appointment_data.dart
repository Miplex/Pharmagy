import 'package:equatable/equatable.dart';

class AppointmentData extends Equatable {
 String firstName;
 String lastName;
 String beginTimeHour;
 String beginTameMinute;
 String endTmeHour;
 String endTimeMinute;
 String appoinment;

   AppointmentData({
    this.firstName = 'Jon',
    this.lastName = 'Smit',
    this.beginTimeHour = '88',
    this.beginTameMinute = '88',
    this.endTmeHour = '99',
    this.endTimeMinute = '99',
    this.appoinment = 'appointment',
  });

  AppointmentData copyWith({
    String? firstName,
    String? lastName,
    String? beginTimeHour,
    String? beginTameMinute,
    String? endTmeHour,
    String? endTimeMinute,
    String? appoinment,
  }) =>
      AppointmentData(
        firstName: firstName ?? this.firstName,
        lastName: lastName ?? this.lastName,
        beginTimeHour: beginTimeHour ?? this.beginTimeHour,
        beginTameMinute: beginTameMinute ?? this.beginTameMinute,
        endTmeHour: endTmeHour ?? this.endTmeHour,
        endTimeMinute: endTimeMinute ?? this.endTimeMinute,
        appoinment: appoinment ?? this.appoinment,
      );

  @override
  
  List<Object?> get props => [firstName, lastName, beginTimeHour, beginTameMinute, endTmeHour, endTimeMinute, appoinment];
}
