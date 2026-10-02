import 'package:equatable/equatable.dart';
import 'package:hive_flutter/adapters.dart';
part 'offset.g.dart';

@HiveType(typeId: 24)
class Offset extends Equatable {
  @HiveField(0)
  final int? imsak;
  @HiveField(1)
  final int? fajr;
  @HiveField(2)
  final int? sunrise;
  @HiveField(3)
  final int? dhuhr;
  @HiveField(4)
  final int? asr;
  @HiveField(5)
  final int? maghrib;
  @HiveField(6)
  final int? sunset;
  @HiveField(7)
  final int? isha;
  @HiveField(8)
  final int? midnight;

  const Offset({
    this.imsak,
    this.fajr,
    this.sunrise,
    this.dhuhr,
    this.asr,
    this.maghrib,
    this.sunset,
    this.isha,
    this.midnight,
  });

  factory Offset.fromJson(Map<String, dynamic> json) => Offset(
    imsak: json['Imsak'] as int?,
    fajr: json['Fajr'] as int?,
    sunrise: json['Sunrise'] as int?,
    dhuhr: json['Dhuhr'] as int?,
    asr: json['Asr'] as int?,
    maghrib: json['Maghrib'] as int?,
    sunset: json['Sunset'] as int?,
    isha: json['Isha'] as int?,
    midnight: json['Midnight'] as int?,
  );

  Map<String, dynamic> toJson() => {
    'Imsak': imsak,
    'Fajr': fajr,
    'Sunrise': sunrise,
    'Dhuhr': dhuhr,
    'Asr': asr,
    'Maghrib': maghrib,
    'Sunset': sunset,
    'Isha': isha,
    'Midnight': midnight,
  };

  @override
  List<Object?> get props {
    return [imsak, fajr, sunrise, dhuhr, asr, maghrib, sunset, isha, midnight];
  }
}
