// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hadith_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class HadithModelAdapter extends TypeAdapter<HadithModel> {
  @override
  final int typeId = 8;

  @override
  HadithModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return HadithModel(
      id: fields[0] as int?,
      chapterNumber: fields[1] as String?,
      chapterEnglish: fields[2] as String?,
      chapterUrdu: fields[3] as String?,
      chapterArabic: fields[4] as String?,
      bookSlug: fields[5] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, HadithModel obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.chapterNumber)
      ..writeByte(2)
      ..write(obj.chapterEnglish)
      ..writeByte(3)
      ..write(obj.chapterUrdu)
      ..writeByte(4)
      ..write(obj.chapterArabic)
      ..writeByte(5)
      ..write(obj.bookSlug);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HadithModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
