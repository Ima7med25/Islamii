import 'package:equatable/equatable.dart';
import 'package:islami_app/features/quran/domain/entity/sura_detail_entity/ayah_entity.dart';
import 'package:islami_app/features/quran/domain/entity/sura_detail_entity/edition_entity.dart';

class SuraDetailsEntity extends Equatable {
  final int? number;
  final String? name;
  final String? englishName;
  final String? englishNameTranslation;
  final String? revelationType;
  final int? numberOfAyahs;
  final List<AyahEntity>? ayahs;
  final EditionEntity? edition;

  const SuraDetailsEntity({
    this.number,
    this.name,
    this.englishName,
    this.englishNameTranslation,
    this.revelationType,
    this.numberOfAyahs,
    this.ayahs,
    this.edition,
  });

  @override
  List<Object?> get props {
    return [
      number,
      name,
      englishName,
      englishNameTranslation,
      revelationType,
      numberOfAyahs,
      ayahs,
      edition,
    ];
  }
}
