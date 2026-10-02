import 'package:equatable/equatable.dart';

class MonthEntity extends Equatable {
  final int? number;
  final String? en;
  final String? ar;
  final int? days;

  const MonthEntity({this.number, this.en, this.ar, this.days});

  @override
  List<Object?> get props => [number, en, ar, days];
}
