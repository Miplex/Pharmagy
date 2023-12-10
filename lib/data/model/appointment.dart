// // To parse this JSON data, do
// //
// //     final appointment = appointmentFromJson(jsonString);

// import 'dart:convert';

// Appointment appointmentFromJson(String str) =>
//     Appointment.fromJson(json.decode(str));

// String appointmentToJson(Appointment data) => json.encode(data.toJson());

// class Appointment {
  
//   Appointment({
//     required this.firstName,
//     required this.lastName,
//     required this.avatarIcon,
//     required this.ovalIcon,
//     required this.beginTimeHour,
//     required this.beginTimeMinute,
//     required this.endTimeHour,
//     required this.endTimeMinute,
//     required this.dropDownButton,
//     //required this.createdTime,
//   });

//   final String firstName;
//   final String lastName;
//   final String avatarIcon;
//   final String ovalIcon;
//   final String beginTimeHour;
//   final String beginTimeMinute;
//   final String endTimeHour;
//   final String endTimeMinute;
//   List<String> dropDownButton = [];
//   //final DateTime createdTime;

  

//   factory Appointment.fromJson(Map<String, dynamic> json) => Appointment(
//         firstName: json["firstName"] as String,
//         lastName: json["lastName"] as String,
//         avatarIcon: json["avatarIcon"],
//         ovalIcon: json["ovalIcon"],
//         beginTimeHour: json["beginTimeHour"] as String,
//         beginTimeMinute: json["beginTimeMinute"] as String,
//         endTimeHour: json["endTimeHour"] as String,
//         endTimeMinute: json["endTimeMinute"] as String,
//         dropDownButton: json["dropDownButton"] as List<String>,
//         // createdTime: DateTime.parse(String),
//       );

//   Map<String, dynamic> toJson() => {
//         "firstName": firstName,
//         "lastName": lastName,
//         "avatarIcon": avatarIcon,
//         "ovalIcon": ovalIcon,
//         "beginTimeHour": beginTimeHour,
//         "beginTimeMinute": beginTimeMinute,
//         "endTimeHour": endTimeHour,
//         "endTimeMinute": endTimeMinute,
//         "dropDownButton": dropDownButton,
//       };
// }
