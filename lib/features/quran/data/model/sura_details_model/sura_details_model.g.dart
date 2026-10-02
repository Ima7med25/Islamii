// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sura_details_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SuraDetailsModelAdapter extends TypeAdapter<SuraDetailsModel> {
  @override
  final int typeId = 4;

  @override
  SuraDetailsModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SuraDetailsModel(
      number: fields[0] as int?,
      name: fields[1] as String?,
      englishName: fields[2] as String?,
      englishNameTranslation: fields[3] as String?,
      revelationType: fields[4] as String?,
      numberOfAyahs: fields[5] as int?,
      ayahs: (fields[6] as List?)?.cast<AyahModel>(),
      edition: fields[7] as EditionModel?,
    );
  }

  @override
  void write(BinaryWriter writer, SuraDetailsModel obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.number)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.englishName)
      ..writeByte(3)
      ..write(obj.englishNameTranslation)
      ..writeByte(4)
      ..write(obj.revelationType)
      ..writeByte(5)
      ..write(obj.numberOfAyahs)
      ..writeByte(6)
      ..write(obj.ayahs)
      ..writeByte(7)
      ..write(obj.edition);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SuraDetailsModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
