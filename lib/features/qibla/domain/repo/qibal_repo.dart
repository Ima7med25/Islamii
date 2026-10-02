import 'dart:async';
import 'package:islami_app/features/qibla/domain/entity/qibla_reading_entitiy.dart';

abstract class QiblaRepository {
  Future<bool> ensureLocationPermission();

  Future<Stream<QiblaReading>> qiblaStream();

  Future<void> dispose();
}
