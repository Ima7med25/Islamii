import 'package:equatable/equatable.dart';
import 'package:islami_app/features/pray/domain/entitiy/pray_entity/month_entity.dart';
import 'package:islami_app/features/pray/domain/entitiy/pray_entity/weekday_entity.dart';

class HijriTimeEntity extends Equatable {
  final String? date;
  final String? format;
  final String? day;
  final WeekdayEntity? weekday;
  final MonthEntity? month;

  const HijriTimeEntity({
    this.date,
    this.format,
    this.day,
    this.weekday,
    this.month,
  });

  @override
  List<Object?> get props => [date, format, day, weekday, month];
}
