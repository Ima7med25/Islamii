// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'date_pray.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class DatePrayAdapter extends TypeAdapter<DatePray> {
  @override
  final int typeId = 15;

  @override
  DatePray read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return DatePray(
      readable: fields[0] as String?,
      timestamp: fields[1] as String?,
      hijri: fields[2] as Hijri?,
      gregorian: fields[3] as Gregorian?,
    );
  }

  @override
  void write(BinaryWriter writer, DatePray obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.readable)
      ..writeByte(1)
      ..write(obj.timestamp)
      ..writeByte(2)
      ..write(obj.hijri)
      ..writeByte(3)
      ..write(obj.gregorian);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DatePrayAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
