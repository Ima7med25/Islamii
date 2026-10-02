// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sura_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SuraModelAdapter extends TypeAdapter<SuraModel> {
  @override
  final int typeId = 1;

  @override
  SuraModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SuraModel(
      number: fields[0] as int?,
      name: fields[1] as String?,
      englishName: fields[2] as String?,
      englishNameTranslation: fields[3] as String?,
      numberOfAyahs: fields[4] as int?,
      revelationType: fields[5] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, SuraModel obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.number)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.englishName)
      ..writeByte(3)
      ..write(obj.englishNameTranslation)
      ..writeByte(4)
      ..write(obj.numberOfAyahs)
      ..writeByte(5)
      ..write(obj.revelationType);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SuraModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
