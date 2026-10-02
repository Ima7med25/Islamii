import 'package:equatable/equatable.dart';

class AyahEntity extends Equatable {
  final int? number;
  final String? audio;
  final List<String>? audioSecondary;
  final String? text;
  final int? numberInSurah;
  final int? juz;
  final int? manzil;
  final int? page;
  final int? ruku;
  final int? hizbQuarter;
  final bool? sajda;

  const AyahEntity({
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
