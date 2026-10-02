// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'offset.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class OffsetAdapter extends TypeAdapter<Offset> {
  @override
  final int typeId = 24;

  @override
  Offset read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Offset(
      imsak: fields[0] as int?,
      fajr: fields[1] as int?,
      sunrise: fields[2] as int?,
      dhuhr: fields[3] as int?,
      asr: fields[4] as int?,
      maghrib: fields[5] as int?,
      sunset: fields[6] as int?,
      isha: fields[7] as int?,
      midnight: fields[8] as int?,
    );
  }

  @override
  void write(BinaryWriter writer, Offset obj) {
    writer
      ..writeByte(9)
      ..writeByte(0)
      ..write(obj.imsak)
      ..writeByte(1)
      ..write(obj.fajr)
      ..writeByte(2)
      ..write(obj.sunrise)
      ..writeByte(3)
      ..write(obj.dhuhr)
      ..writeByte(4)
      ..write(obj.asr)
      ..writeByte(5)
      ..write(obj.maghrib)
      ..writeByte(6)
      ..write(obj.sunset)
      ..writeByte(7)
      ..write(obj.isha)
      ..writeByte(8)
      ..write(obj.midnight);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is OffsetAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
