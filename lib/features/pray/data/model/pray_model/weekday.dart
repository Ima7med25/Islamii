import 'package:equatable/equatable.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:islami_app/features/pray/domain/entitiy/pray_entity/weekday_entity.dart';
part 'weekday.g.dart';

@HiveType(typeId: 17)
class Weekday extends Equatable {
  @HiveField(0)
  final String? en;
  @HiveField(1)
  final String? ar;

  const Weekday({this.en, this.ar});

  WeekdayEntity toEntity() {
    return WeekdayEntity(en: en, ar: ar);
  }

  factory Weekday.fromJson(Map<String, dynamic> json) =>
      Weekday(en: json['en'] as String?, ar: json['ar'] as String?);

  Map<String, dynamic> toJson() => {'en': en, 'ar': ar};

  @override
  List<Object?> get props => [en, ar];
}
