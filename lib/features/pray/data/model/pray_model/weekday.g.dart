// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weekday.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class WeekdayAdapter extends TypeAdapter<Weekday> {
  @override
  final int typeId = 17;

  @override
  Weekday read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Weekday(
      en: fields[0] as String?,
      ar: fields[1] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, Weekday obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.en)
      ..writeByte(1)
      ..write(obj.ar);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is WeekdayAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
