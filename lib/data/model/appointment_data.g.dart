// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'appointment_data.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AppointmentDataAdapter extends TypeAdapter<AppointmentData> {
  @override
  final int typeId = 1;

  @override
  AppointmentData read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return AppointmentData(
      id: fields[0] as String?,
      countBadges: fields[8] as int?,
      firstName: fields[1] as String,
      lastName: fields[2] as String,
      beginTimeHour: fields[3] as String,
      beginTimeMinute: fields[4] as String,
      endTimeHour: fields[5] as String,
      endTimeMinute: fields[6] as String,
      appointment: fields[7] as String,
    );
  }

  @override
  void write(BinaryWriter writer, AppointmentData obj) {
    writer
      ..writeByte(9)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.firstName)
      ..writeByte(2)
      ..write(obj.lastName)
      ..writeByte(3)
      ..write(obj.beginTimeHour)
      ..writeByte(4)
      ..write(obj.beginTimeMinute)
      ..writeByte(5)
      ..write(obj.endTimeHour)
      ..writeByte(6)
      ..write(obj.endTimeMinute)
      ..writeByte(7)
      ..write(obj.appointment)
      ..writeByte(8)
      ..write(obj.countBadges);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AppointmentDataAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
