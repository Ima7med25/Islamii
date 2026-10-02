import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';
import 'package:islami_app/features/pray/domain/entitiy/pray_entity/month_entity.dart';
part 'month.g.dart';

@HiveType(typeId: 18)
class Month extends Equatable {
  @HiveField(0)
  final int? number;
  @HiveField(1)
  final String? en;
  @HiveField(2)
  final String? ar;
  @HiveField(3)
  final int? days;

  const Month({this.number, this.en, this.ar, this.days});

  MonthEntity toEntity() {
    return MonthEntity(number: number, en: en, ar: ar, days: days);
  }

  factory Month.fromJson(Map<String, dynamic> json) => Month(
    number: json['number'] as int?,
    en: json['en'] as String?,
    ar: json['ar'] as String?,
    days: json['days'] as int?,
  );

  Map<String, dynamic> toJson() => {
    'number': number,
    'en': en,
    'ar': ar,
    'days': days,
  };

  @override
  List<Object?> get props => [number, en, ar, days];
}
