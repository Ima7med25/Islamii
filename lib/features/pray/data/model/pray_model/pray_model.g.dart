// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pray_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PrayModelAdapter extends TypeAdapter<PrayModel> {
  @override
  final int typeId = 13;

  @override
  PrayModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PrayModel(
      timings: fields[0] as Timings?,
      date: fields[1] as DatePray?,
      meta: fields[2] as Meta?,
    );
  }

  @override
  void write(BinaryWriter writer, PrayModel obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.timings)
      ..writeByte(1)
      ..write(obj.date)
      ..writeByte(2)
      ..write(obj.meta);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PrayModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
