import 'package:islami_app/features/pray/domain/entitiy/pray_entity/time_pray_entity.dart';

MapEntry<String, DateTime> getNextPrayer24h(
  TimePrayEntity t, {
  required DateTime baseDate,
}) {
  DateTime parse(String text) {
    final parts = text.split(':');
    final hour = int.parse(parts[0]);
    final minute = int.parse(parts[1]);
    return DateTime(baseDate.year, baseDate.month, baseDate.day, hour, minute);
  }

  final prayers = <MapEntry<String, DateTime>>[
    MapEntry('الفجر', parse(t.fajr!)),
    MapEntry('الظهر', parse(t.dhuhr!)),
    MapEntry('العصر', parse(t.asr!)),
    MapEntry('المغرب', parse(t.maghrib!)),
    MapEntry('العشاء', parse(t.isha!)),
  ];

  final now = DateTime.now();

  for (final e in prayers) {
    if (e.value.isAfter(now)) {
      return e;
    }
  }

  return MapEntry('الفجر', parse(t.fajr!).add(const Duration(days: 1)));
}
