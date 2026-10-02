import 'dart:async';
import 'dart:io' show Platform;
import 'package:flutter_compass/flutter_compass.dart';
import 'package:geolocator/geolocator.dart';
import 'package:islami_app/core/service/geo_math_service.dart';
import 'package:islami_app/features/qibla/domain/entity/qibla_reading_entitiy.dart';
import 'package:islami_app/features/qibla/domain/repo/qibal_repo.dart';

class QiblaRepositoryImpl implements QiblaRepository {
  StreamSubscription? _compassSub;
  StreamController<QiblaReading>? _controller;

  @override
  Future<bool> ensureLocationPermission() async {
    final serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) return false;

    var permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }
    if (permission == LocationPermission.denied ||
        permission == LocationPermission.deniedForever) {
      return false;
    }
    return true;
  }

  @override
  Future<Stream<QiblaReading>> qiblaStream() async {
    final pos = await Geolocator.getCurrentPosition(
      // ignore: deprecated_member_use
      desiredAccuracy:
          Platform.isIOS
              ? LocationAccuracy.bestForNavigation
              : LocationAccuracy.high,
    );

    final bearing = GeoMathService.computeQiblaBearing(
      pos.latitude,
      pos.longitude,
    );

    _controller?.close();
    _controller = StreamController<QiblaReading>.broadcast();

    _compassSub?.cancel();
    _compassSub = FlutterCompass.events?.listen(
      (event) {
        final h = event.heading;
        if (h == null) return;
        _controller?.add(
          QiblaReading(
            latitude: pos.latitude,
            longitude: pos.longitude,
            bearingToQibla: bearing,
            heading: h,
          ),
        );
      },
      onError: (e) {
        _controller?.addError(e);
      },
    );

    _controller?.onCancel = () async {
      await _compassSub?.cancel();
      _compassSub = null;
    };

    return _controller!.stream;
  }

  @override
  Future<void> dispose() async {
    await _compassSub?.cancel();
    await _controller?.close();
  }
}
