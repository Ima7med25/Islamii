import 'dart:math';

abstract class GeoMathService {
  static const kaabaLat = 21.4225;
  static const kaabaLon = 39.8262;

  static double _deg2rad(double d) => d * pi / 180.0;
  static double _rad2deg(double r) => r * 180.0 / pi;

  static double computeQiblaBearing(double userLat, double userLon) {
    final phi1 = _deg2rad(userLat);
    final phi2 = _deg2rad(kaabaLat);
    final dLon = _deg2rad(kaabaLon - userLon);

    final y = sin(dLon) * cos(phi2);
    final x = cos(phi1) * sin(phi2) - sin(phi1) * cos(phi2) * cos(dLon);
    return (_rad2deg(atan2(y, x)) + 360.0) % 360.0;
  }

  static double headingToQiblaDiff(double heading, double bearing) {
    return (bearing - heading + 360.0) % 360.0;
  }
}
