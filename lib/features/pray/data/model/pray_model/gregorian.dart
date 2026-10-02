import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';
import 'package:islami_app/features/pray/domain/entitiy/pray_entity/gregorian_entity.dart';
import 'designation.dart';
import 'month.dart';
import 'weekday.dart';
part 'gregorian.g.dart';

@HiveType(typeId: 20)
class Gregorian extends Equatable {
  @HiveField(0)
  final String? date;
  @HiveField(1)
  final String? format;
  @HiveField(2)
  final String? day;
  @HiveField(3)
  final Weekday? weekday;
  @HiveField(4)
  final Month? month;
  @HiveField(5)
  final String? year;
  @HiveField(6)
  final Designation? designation;
  @HiveField(7)
  final bool? lunarSighting;

  const Gregorian({
    this.date,
    this.format,
    this.day,
    this.weekday,
    this.month,
    this.year,
    this.designation,
    this.lunarSighting,
  });

  GregorianEntity toEntity() {
    return GregorianEntity(date: date);
  }

  factory Gregorian.fromJson(Map<String, dynamic> json) => Gregorian(
    date: json['date'] as String?,
    format: json['format'] as String?,
    day: json['day'] as String?,
    weekday:
        json['weekday'] == null
            ? null
            : Weekday.fromJson(json['weekday'] as Map<String, dynamic>),
    month:
        json['month'] == null
            ? null
            : Month.fromJson(json['month'] as Map<String, dynamic>),
    year: json['year'] as String?,
    designation:
        json['designation'] == null
            ? null
            : Designation.fromJson(json['designation'] as Map<String, dynamic>),
    lunarSighting: json['lunarSighting'] as bool?,
  );

  Map<String, dynamic> toJson() => {
    'date': date,
    'format': format,
    'day': day,
    'weekday': weekday?.toJson(),
    'month': month?.toJson(),
    'year': year,
    'designation': designation?.toJson(),
    'lunarSighting': lunarSighting,
  };

  @override
  List<Object?> get props {
    return [
      date,
      format,
      day,
      weekday,
      month,
      year,
      designation,
      lunarSighting,
    ];
  }
}
