import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';
import 'package:islami_app/features/quran/domain/entity/sura_detail_entity/sura_details_entity.dart';
import 'ayah.dart';
import 'edition.dart';
part 'sura_details_model.g.dart';

@HiveType(typeId: 4)
class SuraDetailsModel extends Equatable {
  @HiveField(0)
  final int? number;
  @HiveField(1)
  final String? name;
  @HiveField(2)
  final String? englishName;
  @HiveField(3)
  final String? englishNameTranslation;
  @HiveField(4)
  final String? revelationType;
  @HiveField(5)
  final int? numberOfAyahs;
  @HiveField(6)
  final List<AyahModel>? ayahs;
  @HiveField(7)
  final EditionModel? edition;

  const SuraDetailsModel({
    this.number,
    this.name,
    this.englishName,
    this.englishNameTranslation,
    this.revelationType,
    this.numberOfAyahs,
    this.ayahs,
    this.edition,
  });

  factory SuraDetailsModel.fromJson(Map<String, dynamic> json) =>
      SuraDetailsModel(
        number: json['number'] as int?,
        name: json['name'] as String?,
        englishName: json['englishName'] as String?,
        englishNameTranslation: json['englishNameTranslation'] as String?,
        revelationType: json['revelationType'] as String?,
        numberOfAyahs: json['numberOfAyahs'] as int?,
        ayahs:
            (json['ayahs'] as List<dynamic>?)
                ?.map((e) => AyahModel.fromJson(e as Map<String, dynamic>))
                .toList(),
        edition:
            json['edition'] == null
                ? null
                : EditionModel.fromJson(
                  json['edition'] as Map<String, dynamic>,
                ),
      );

  Map<String, dynamic> toJson() => {
    'number': number,
    'name': name,
    'englishName': englishName,
    'englishNameTranslation': englishNameTranslation,
    'revelationType': revelationType,
    'numberOfAyahs': numberOfAyahs,
    'ayahs': ayahs?.map((e) => e.toJson()).toList(),
    'edition': edition?.toJson(),
  };

  toEntity() {
    return SuraDetailsEntity(
      number: number,
      name: name,
      englishName: englishName,
      englishNameTranslation: englishNameTranslation,
      revelationType: revelationType,
      numberOfAyahs: numberOfAyahs,
      ayahs: ayahs?.map((e) => e.toEntity()).toList(),
      edition: edition?.toEntity(),
    );
  }

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
