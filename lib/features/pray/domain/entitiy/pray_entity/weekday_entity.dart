import 'package:equatable/equatable.dart';

class WeekdayEntity extends Equatable {
  final String? en;
  final String? ar;

  const WeekdayEntity({this.en, this.ar});

  @override
  List<Object?> get props => [en, ar];
}
