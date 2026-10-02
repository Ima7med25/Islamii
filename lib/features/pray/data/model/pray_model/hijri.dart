import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';
import 'package:islami_app/features/pray/domain/entitiy/pray_entity/hijri_time_entity.dart';
import 'designation.dart';
import 'month.dart';
import 'weekday.dart';
part 'hijri.g.dart';

@HiveType(typeId: 16)
class Hijri extends Equatable {
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
  final List<dynamic>? holidays;
  @HiveField(8)
  final List<dynamic>? adjustedHolidays;
  @HiveField(9)
  final String? method;

  const Hijri({
    this.date,
    this.format,
    this.day,
    this.weekday,
    this.month,
    this.year,
    this.designation,
    this.holidays,
    this.adjustedHolidays,
    this.method,
  });

  HijriTimeEntity toEntity() {
    return HijriTimeEntity(
      date: date,
      format: format,
      day: day,
      weekday: weekday?.toEntity(),
      month: month?.toEntity(),
    );
  }

  factory Hijri.fromJson(Map<String, dynamic> json) => Hijri(
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
    holidays: json['holidays'] as List<dynamic>?,
    adjustedHolidays: json['adjustedHolidays'] as List<dynamic>?,
    method: json['method'] as String?,
  );

  Map<String, dynamic> toJson() => {
    'date': date,
    'format': format,
    'day': day,
    'weekday': weekday?.toJson(),
    'month': month?.toJson(),
    'year': year,
    'designation': designation?.toJson(),
    'holidays': holidays,
    'adjustedHolidays': adjustedHolidays,
    'method': method,
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
      holidays,
      adjustedHolidays,
      method,
    ];
  }
}
