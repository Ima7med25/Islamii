// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'audio_details_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AudioDetailsModelAdapter extends TypeAdapter<AudioDetailsModel> {
  @override
  final int typeId = 7;

  @override
  AudioDetailsModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return AudioDetailsModel(
      reciter: fields[0] as String?,
      url: fields[1] as String?,
      originalUrl: fields[2] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, AudioDetailsModel obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.reciter)
      ..writeByte(1)
      ..write(obj.url)
      ..writeByte(2)
      ..write(obj.originalUrl);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AudioDetailsModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
