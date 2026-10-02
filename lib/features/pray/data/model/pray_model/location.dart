import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';
part 'location.g.dart';

@HiveType(typeId: 22)
class Location extends Equatable {
  @HiveField(0)
  final double? latitude;
  @HiveField(1)
  final double? longitude;

  const Location({this.latitude, this.longitude});

  factory Location.fromJson(Map<String, dynamic> json) => Location(
    latitude: (json['latitude'] as num?)?.toDouble(),
    longitude: (json['longitude'] as num?)?.toDouble(),
  );

  Map<String, dynamic> toJson() => {
    'latitude': latitude,
    'longitude': longitude,
  };

  @override
  List<Object?> get props => [latitude, longitude];
}
