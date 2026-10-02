// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'timings.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TimingsAdapter extends TypeAdapter<Timings> {
  @override
  final int typeId = 14;

  @override
  Timings read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Timings(
      fajr: fields[0] as String?,
      sunrise: fields[1] as String?,
      dhuhr: fields[2] as String?,
      asr: fields[3] as String?,
      sunset: fields[4] as String?,
      maghrib: fields[5] as String?,
      isha: fields[6] as String?,
      imsak: fields[7] as String?,
      midnight: fields[8] as String?,
      firstthird: fields[9] as String?,
      lastthird: fields[10] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, Timings obj) {
    writer
      ..writeByte(11)
      ..writeByte(0)
      ..write(obj.fajr)
      ..writeByte(1)
      ..write(obj.sunrise)
      ..writeByte(2)
      ..write(obj.dhuhr)
      ..writeByte(3)
      ..write(obj.asr)
      ..writeByte(4)
      ..write(obj.sunset)
      ..writeByte(5)
      ..write(obj.maghrib)
      ..writeByte(6)
      ..write(obj.isha)
      ..writeByte(7)
      ..write(obj.imsak)
      ..writeByte(8)
      ..write(obj.midnight)
      ..writeByte(9)
      ..write(obj.firstthird)
      ..writeByte(10)
      ..write(obj.lastthird);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TimingsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
