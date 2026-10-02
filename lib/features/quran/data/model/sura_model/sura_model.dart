import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';
import 'package:islami_app/features/quran/domain/entity/sura_entity/sura_entity.dart';

part 'sura_model.g.dart';

@HiveType(typeId: 1)
class SuraModel extends Equatable {
  @HiveField(0)
  final int? number;
  @HiveField(1)
  final String? name;
  @HiveField(2)
  final String? englishName;
  @HiveField(3)
  final String? englishNameTranslation;
  @HiveField(4)
  final int? numberOfAyahs;
  @HiveField(5)
  final String? revelationType;

  const SuraModel({
    this.number,
    this.name,
    this.englishName,
    this.englishNameTranslation,
    this.numberOfAyahs,
    this.revelationType,
  });

  factory SuraModel.fromJson(Map<String, dynamic> json) => SuraModel(
    number: json['number'] as int?,
    name: json['name'] as String?,
    englishName: json['englishName'] as String?,
    englishNameTranslation: json['englishNameTranslation'] as String?,
    numberOfAyahs: json['numberOfAyahs'] as int?,
    revelationType: json['revelationType'] as String?,
  );

  Map<String, dynamic> toJson() => {
    'number': number,
    'name': name,
    'englishName': englishName,
    'englishNameTranslation': englishNameTranslation,
    'numberOfAyahs': numberOfAyahs,
    'revelationType': revelationType,
  };

  SuraEntity toEntity() => SuraEntity(
    number: number ?? 0,
    name: name ?? '',
    englishName: englishName ?? '',
    numberOfAyahs: numberOfAyahs ?? 0,
  );

  @override
  List<Object?> get props {
    return [
      number,
      name,
      englishName,
      englishNameTranslation,
      numberOfAyahs,
      revelationType,
    ];
  }
}
