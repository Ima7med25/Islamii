import 'package:equatable/equatable.dart';

class TimePrayEntity extends Equatable {
  final String? fajr;
  final String? dhuhr;
  final String? asr;
  final String? maghrib;
  final String? isha;

  const TimePrayEntity({
    this.fajr,
    this.dhuhr,
    this.asr,
    this.maghrib,
    this.isha,
  });

  @override
  List<Object?> get props => [fajr, dhuhr, asr, maghrib, isha];
}
