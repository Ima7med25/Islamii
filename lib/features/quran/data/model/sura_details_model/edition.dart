import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';
import 'package:islami_app/features/quran/domain/entity/sura_detail_entity/edition_entity.dart';

part 'edition.g.dart';

@HiveType(typeId: 3)
class EditionModel extends Equatable {
  @HiveField(0)
  final String? identifier;
  @HiveField(1)
  final String? language;
  @HiveField(2)
  final String? name;
  @HiveField(3)
  final String? englishName;
  @HiveField(4)
  final String? format;
  @HiveField(5)
  final String? type;
  @HiveField(6)
  final dynamic direction;

  const EditionModel({
    this.identifier,
    this.language,
    this.name,
    this.englishName,
    this.format,
    this.type,
    this.direction,
  });

  factory EditionModel.fromJson(Map<String, dynamic> json) => EditionModel(
    identifier: json['identifier'] as String?,
    language: json['language'] as String?,
    name: json['name'] as String?,
    englishName: json['englishName'] as String?,
    format: json['format'] as String?,
    type: json['type'] as String?,
    direction: json['direction'] as dynamic,
  );

  Map<String, dynamic> toJson() => {
    'identifier': identifier,
    'language': language,
    'name': name,
    'englishName': englishName,
    'format': format,
    'type': type,
    'direction': direction,
  };

  EditionEntity toEntity() => EditionEntity(
    identifier: identifier ?? '',
    language: language ?? '',
    name: name ?? '',
    englishName: englishName ?? '',
    format: format ?? '',
    type: type ?? '',
    direction: direction ?? '',
  );

  @override
  List<Object?> get props {
    return [identifier, language, name, englishName, format, type, direction];
  }
}
