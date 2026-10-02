// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'audio_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AudioModelAdapter extends TypeAdapter<AudioModel> {
  @override
  final int typeId = 6;

  @override
  AudioModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return AudioModel(
      audioDetailsModel1: fields[0] as AudioDetailsModel?,
      audioDetailsModel2: fields[1] as AudioDetailsModel?,
      audioDetailsModel3: fields[2] as AudioDetailsModel?,
      audioDetailsModel4: fields[3] as AudioDetailsModel?,
      audioDetailsModel5: fields[4] as AudioDetailsModel?,
    );
  }

  @override
  void write(BinaryWriter writer, AudioModel obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.audioDetailsModel1)
      ..writeByte(1)
      ..write(obj.audioDetailsModel2)
      ..writeByte(2)
      ..write(obj.audioDetailsModel3)
      ..writeByte(3)
      ..write(obj.audioDetailsModel4)
      ..writeByte(4)
      ..write(obj.audioDetailsModel5);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AudioModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
