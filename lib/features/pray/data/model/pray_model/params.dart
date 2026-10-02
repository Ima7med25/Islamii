import 'package:equatable/equatable.dart';
import 'package:hive_flutter/adapters.dart';
part 'params.g.dart';

@HiveType(typeId: 25)
class Params extends Equatable {
  @HiveField(0)
  final double? fajr;
  @HiveField(1)
  final double? isha;

  const Params({this.fajr, this.isha});

  factory Params.fromJson(Map<String, dynamic> json) => Params(
    fajr: (json['Fajr'] as num?)?.toDouble(),
    isha: (json['Isha'] as num?)?.toDouble(),
  );

  Map<String, dynamic> toJson() => {'Fajr': fajr, 'Isha': isha};

  @override
  List<Object?> get props => [fajr, isha];
}
