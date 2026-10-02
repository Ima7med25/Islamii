import 'dart:async';
import 'dart:developer';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:timezone/data/latest_all.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

@pragma('vm:entry-point')
FutureOr<void> onSelectNotification(NotificationResponse details) async {}

class LocalNotificationService {
  static Future<void> requestNotificationPermission() async {
    // Request notification permission (Android 13+)
    final notificationStatus = await Permission.notification.request();
    if (notificationStatus.isGranted) {
      log("Notification permission granted");
    } else {
      log("Notification permission denied");
    }

    // Request exact alarm permission (Android 12+) for precise adhan scheduling
    final exactAlarmStatus = await Permission.scheduleExactAlarm.request();
    if (exactAlarmStatus.isGranted) {
      log("Exact alarm permission granted");
    } else {
      log("Exact alarm permission denied - adhan notifications may not be precise");
    }
  }

  static final flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  static Future<void> init() async {
    try {
      tz.initializeTimeZones();
      log('Timezone database initialized');
    } catch (e) {
      log('Failed to initialize timezone: $e');
    }
    try {
      await flutterLocalNotificationsPlugin.initialize(
        InitializationSettings(
          android: AndroidInitializationSettings('@mipmap/ic_launcher'),
          iOS: DarwinInitializationSettings(),
          macOS: DarwinInitializationSettings(),
        ),
      );
      await flutterLocalNotificationsPlugin
          .resolvePlatformSpecificImplementation<
            IOSFlutterLocalNotificationsPlugin
          >()
          ?.requestPermissions(alert: true, badge: true, sound: true);
      await flutterLocalNotificationsPlugin
          .resolvePlatformSpecificImplementation<
            MacOSFlutterLocalNotificationsPlugin
          >()
          ?.requestPermissions(alert: true, badge: true, sound: true);

      log(
        'LocalNotificationService initialized and permissions requested where applicable',
      );
    } catch (e) {
      log('Error initializing notification plugin: $e');
    }
  }

  static void changeTimezone(String tzName) {
    tz.setLocalLocation(tz.getLocation(tzName));
  }

  static Future<void> scheduleNotification({
    required int id,
    required String title,
    required tz.TZDateTime localTime,
    required NotificationDetails details,
    String? body,
  }) async {
    try {
      log('Scheduling notification id=$id at $localTime');
      await flutterLocalNotificationsPlugin.zonedSchedule(
        id,
        title,
        body,
        localTime,
        details,
        androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,

        matchDateTimeComponents: DateTimeComponents.time,
      );
      log('Scheduled notification id=$id');
    } catch (e) {
      log('Error scheduling notification id=$id: $e');
    }
  }

  static Future<void> cancelAll() =>
      flutterLocalNotificationsPlugin.cancelAll();
}
