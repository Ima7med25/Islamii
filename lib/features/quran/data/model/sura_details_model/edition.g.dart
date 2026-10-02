// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'edition.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class EditionModelAdapter extends TypeAdapter<EditionModel> {
  @override
  final int typeId = 3;

  @override
  EditionModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return EditionModel(
      identifier: fields[0] as String?,
      language: fields[1] as String?,
      name: fields[2] as String?,
      englishName: fields[3] as String?,
      format: fields[4] as String?,
      type: fields[5] as String?,
      direction: fields[6] as dynamic,
    );
  }

  @override
  void write(BinaryWriter writer, EditionModel obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.identifier)
      ..writeByte(1)
      ..write(obj.language)
      ..writeByte(2)
      ..write(obj.name)
      ..writeByte(3)
      ..write(obj.englishName)
      ..writeByte(4)
      ..write(obj.format)
      ..writeByte(5)
      ..write(obj.type)
      ..writeByte(6)
      ..write(obj.direction);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is EditionModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
