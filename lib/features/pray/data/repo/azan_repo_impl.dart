import 'dart:developer';

import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:hive/hive.dart';
import 'package:islami_app/core/api/api_keys.dart';
import 'package:islami_app/core/service/local_notification_service.dart';
import 'package:islami_app/features/pray/data/model/pray_model/pray_model.dart';
import 'package:islami_app/features/pray/domain/repo/azan_repo.dart';
import 'package:timezone/timezone.dart' as tz;

class AzanRepoImpl implements AzanRepo {
  @override
  Future<void> scheduleAdhan({
    required int id,
    required DateTime prayerTimeLocal,
    required String title,
    required String body,
    required bool playSound,
  }) async {
    final tzTime = tz.TZDateTime.from(prayerTimeLocal, tz.local);

    log('Scheduling notification id=$id at $tzTime');

    final androidDetails = AndroidNotificationDetails(
      'adhan_channel',
      'Adhan',
      channelDescription: 'Prayer Adhan notifications',
      importance: Importance.max,
      priority: Priority.high,
      playSound: playSound,
      sound: const RawResourceAndroidNotificationSound('adhan'),
      category: AndroidNotificationCategory.alarm,
      fullScreenIntent: true,
      icon: "android12splash",
    );

    const iosDetails = DarwinNotificationDetails(
      sound: 'adhan.mp3',
      interruptionLevel: InterruptionLevel.timeSensitive,
      presentSound: true,
      presentAlert: true,
    );

    final details = NotificationDetails(
      android: androidDetails,
      iOS: iosDetails,
    );

    await LocalNotificationService.scheduleNotification(
      id: id,
      title: title,
      localTime: tzTime,
      details: details,
      body: body,
    );
  }

  @override
  Future<void> scheduleTodayAdhan({bool playSound = true}) async {
    await LocalNotificationService.cancelAll();
    log("============================== scheduleTodayAdhan");
    final prayer = Hive.box<PrayModel>(ApiKeys.prayBox);
    final prayModel = prayer.values.first;

    if (prayModel.timings == null) {
      return;
    } else {
      DateTime? parsePrayerTime(String? t) {
        if (t == null) return null;
        final match = RegExp(r"(\d{1,2}:\d{2})").firstMatch(t);
        if (match == null) return null;
        final parts = match.group(1)!.split(":");
        final hour = int.parse(parts[0]);
        final minute = int.parse(parts[1]);
        final now = DateTime.now();
        return DateTime(now.year, now.month, now.day, hour, minute);
      }

      DateTime ensureFuture(DateTime dt) {
        if (dt.isBefore(DateTime.now())) return dt.add(const Duration(days: 1));
        return dt;
      }

      final fajrTime = parsePrayerTime(prayModel.timings?.fajr);
      final dhuhrTime = parsePrayerTime(prayModel.timings?.dhuhr);
      final asrTime = parsePrayerTime(prayModel.timings?.asr);
      final maghribTime = parsePrayerTime(prayModel.timings?.maghrib);
      final ishaTime = parsePrayerTime(prayModel.timings?.isha);

      if (fajrTime != null) {
        log("fajr time======= ${fajrTime.toString()}");
        await scheduleAdhan(
          id: 101,
          prayerTimeLocal: ensureFuture(fajrTime),
          title: 'أذان الفجر',
          body: 'حان الآن موعد أذان الفجر',
          playSound: playSound,
        );
      }
      if (dhuhrTime != null) {
        log("dhuhr time======= ${dhuhrTime.toString()}");
        await scheduleAdhan(
          id: 102,
          prayerTimeLocal: ensureFuture(dhuhrTime),
          title: 'أذان الظهر',
          body: 'حان الآن موعد أذان الظهر',
          playSound: playSound,
        );
      }
      if (asrTime != null) {
        log("asr time======= ${asrTime.toString()}");
        await scheduleAdhan(
          id: 103,
          prayerTimeLocal: ensureFuture(asrTime),
          title: 'أذان العصر',
          body: 'حان الآن موعد أذان العصر',
          playSound: playSound,
        );
      }
      if (maghribTime != null) {
        log("maghrib time======= ${maghribTime.toString()}");
        await scheduleAdhan(
          id: 104,
          prayerTimeLocal: ensureFuture(maghribTime),
          title: 'أذان المغرب',
          body: 'حان الآن موعد أذان المغرب',
          playSound: playSound,
        );
      }
      if (ishaTime != null) {
        log("isha time======= ${ishaTime.toString()}");
        await scheduleAdhan(
          id: 105,
          prayerTimeLocal: ensureFuture(ishaTime),
          title: 'أذان العشاء',
          body: 'حان الآن موعد أذان العشاء',
          playSound: playSound,
        );
      }
    }
  }
}
