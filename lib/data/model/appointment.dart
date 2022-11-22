// To parse this JSON data, do
//
//     final appointment = appointmentFromJson(jsonString);

import 'dart:convert';

Appointment appointmentFromJson(String str) => Appointment.fromJson(json.decode(str));

String appointmentToJson(Appointment data) => json.encode(data.toJson());

class Appointment {
    Appointment({
        required this.firstName,
        required this.lastName,
        required this.avatarIcon,
        required this.ovalIcon,
        required this.timeBegin,
        required this.timeEnd,
    });

   final String firstName;
   final String lastName;
   final String avatarIcon;
   final String ovalIcon;
   final String timeBegin;
   final String timeEnd;

    factory Appointment.fromJson(Map<String, dynamic> json) => Appointment(
        firstName: json["firstName"],
        lastName: json["lastName"],
        avatarIcon: json["avatarIcon"],
        ovalIcon: json["ovalIcon"],
        timeBegin: json["timeBegin"],
        timeEnd: json["timeEnd"],
    );

    Map<String, dynamic> toJson() => {
        "firstName": firstName,
        "lastName": lastName,
        "avatarIcon": avatarIcon,
        "ovalIcon": ovalIcon,
        "timeBegin": timeBegin,
        "timeEnd": timeEnd,
    };
}
