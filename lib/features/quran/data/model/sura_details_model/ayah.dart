import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';
import 'package:islami_app/features/quran/domain/entity/sura_detail_entity/ayah_entity.dart';

part 'ayah.g.dart';

@HiveType(typeId: 2)
class AyahModel extends Equatable {
  @HiveField(0)
  final int? number;
  @HiveField(1)
  final String? audio;
  @HiveField(2)
  final List<String>? audioSecondary;
  @HiveField(3)
  final String? text;
  @HiveField(4)
  final int? numberInSurah;
  @HiveField(5)
  final int? juz;
  @HiveField(6)
  final int? manzil;
  @HiveField(7)
  final int? page;
  @HiveField(8)
  final int? ruku;
  @HiveField(9)
  final int? hizbQuarter;
  @HiveField(10)
  final bool? sajda;

  const AyahModel({
    this.number,
    this.audio,
    this.audioSecondary,
    this.text,
    this.numberInSurah,
    this.juz,
    this.manzil,
    this.page,
    this.ruku,
    this.hizbQuarter,
    this.sajda,
  });

  factory AyahModel.fromJson(Map<String, dynamic> json) => AyahModel(
    number: json['number'] as int?,
    audio: json['audio'] as String?,
    audioSecondary: json['audioSecondary'] as List<String>?,
    text: json['text'] as String?,
    numberInSurah: json['numberInSurah'] as int?,
    juz: json['juz'] as int?,
    manzil: json['manzil'] as int?,
    page: json['page'] as int?,
    ruku: json['ruku'] as int?,
    hizbQuarter: json['hizbQuarter'] as int?,
    sajda: json['sajda'] as bool?,
  );

  Map<String, dynamic> toJson() => {
    'number': number,
    'audio': audio,
    'audioSecondary': audioSecondary,
    'text': text,
    'numberInSurah': numberInSurah,
    'juz': juz,
    'manzil': manzil,
    'page': page,
    'ruku': ruku,
    'hizbQuarter': hizbQuarter,
    'sajda': sajda,
  };

  AyahEntity toEntity() => AyahEntity(
    number: number ?? 0,
    audio: audio ?? '',
    audioSecondary: audioSecondary ?? [],
    text: text ?? '',
    numberInSurah: numberInSurah ?? 0,
    juz: juz ?? 0,
    manzil: manzil ?? 0,
    page: page ?? 0,
    ruku: ruku ?? 0,
    hizbQuarter: hizbQuarter ?? 0,
    sajda: sajda ?? false,
  );

  @override
  List<Object?> get props {
    return [
      number,
      audio,
      audioSecondary,
      text,
      numberInSurah,
      juz,
      manzil,
      page,
      ruku,
      hizbQuarter,
      sajda,
    ];
  }
}
