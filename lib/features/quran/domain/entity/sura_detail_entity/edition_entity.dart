import 'package:equatable/equatable.dart';

class EditionEntity extends Equatable {
  final String? identifier;
  final String? language;
  final String? name;
  final String? englishName;
  final String? format;
  final String? type;
  final dynamic direction;

  const EditionEntity({
    this.identifier,
    this.language,
    this.name,
    this.englishName,
    this.format,
    this.type,
    this.direction,
  });

  @override
  List<Object?> get props {
    return [identifier, language, name, englishName, format, type, direction];
  }
}
