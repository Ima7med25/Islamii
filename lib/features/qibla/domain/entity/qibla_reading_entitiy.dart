import 'package:equatable/equatable.dart';

class QiblaReading extends Equatable {
  final double latitude;
  final double longitude;
  final double bearingToQibla;
  final double heading;
  double get diff => (bearingToQibla - heading + 360.0) % 360.0;

  const QiblaReading({
    required this.latitude,
    required this.longitude,
    required this.bearingToQibla,
    required this.heading,
  });

  QiblaReading copyWith({
    double? latitude,
    double? longitude,
    double? bearingToQibla,
    double? heading,
  }) {
    return QiblaReading(
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
      bearingToQibla: bearingToQibla ?? this.bearingToQibla,
      heading: heading ?? this.heading,
    );
  }

  @override
  List<Object?> get props => [latitude, longitude, bearingToQibla, heading];
}
