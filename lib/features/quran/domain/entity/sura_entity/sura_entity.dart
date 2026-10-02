import 'package:equatable/equatable.dart';

class SuraEntity extends Equatable {
  final int number;
  final String name;
  final String englishName;
  final int numberOfAyahs;

  const SuraEntity({
    required this.number,
    required this.name,
    required this.englishName,
    required this.numberOfAyahs,
  });

  @override
  List<Object?> get props => [number, name, englishName, numberOfAyahs];
}
