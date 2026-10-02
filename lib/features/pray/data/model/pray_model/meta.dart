import 'package:equatable/equatable.dart';
import 'package:hive_flutter/adapters.dart';
import 'method.dart';
import 'offset.dart';
part 'meta.g.dart';

@HiveType(typeId: 21)
class Meta extends Equatable {
  @HiveField(0)
  final double? latitude;
  @HiveField(1)
  final double? longitude;
  @HiveField(2)
  final String? timezone;
  @HiveField(3)
  final Method? method;
  @HiveField(4)
  final String? latitudeAdjustmentMethod;
  @HiveField(5)
  final String? midnightMode;
  @HiveField(6)
  final String? school;
  @HiveField(7)
  final Offset? offset;

  const Meta({
    this.latitude,
    this.longitude,
    this.timezone,
    this.method,
    this.latitudeAdjustmentMethod,
    this.midnightMode,
    this.school,
    this.offset,
  });

  factory Meta.fromJson(Map<String, dynamic> json) => Meta(
    latitude: (json['latitude'] as num?)?.toDouble(),
    longitude: (json['longitude'] as num?)?.toDouble(),
    timezone: json['timezone'] as String?,
    method: json['method'] == null
        ? null
        : Method.fromJson(json['method'] as Map<String, dynamic>),
    latitudeAdjustmentMethod: json['latitudeAdjustmentMethod'] as String?,
    midnightMode: json['midnightMode'] as String?,
    school: json['school'] as String?,
    offset: json['offset'] == null
        ? null
        : Offset.fromJson(json['offset'] as Map<String, dynamic>),
  );

  Map<String, dynamic> toJson() => {
    'latitude': latitude,
    'longitude': longitude,
    'timezone': timezone,
    'method': method?.toJson(),
    'latitudeAdjustmentMethod': latitudeAdjustmentMethod,
    'midnightMode': midnightMode,
    'school': school,
    'offset': offset?.toJson(),
  };

  @override
  List<Object?> get props {
    return [
      latitude,
      longitude,
      timezone,
      method,
      latitudeAdjustmentMethod,
      midnightMode,
      school,
      offset,
    ];
  }
}
