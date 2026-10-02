import 'dart:developer';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:islami_app/core/service/get_current_location_service.dart';
import 'package:islami_app/core/service/hive_service.dart';
import 'package:islami_app/core/service/local_notification_service.dart';
import 'package:islami_app/core/service/my_bloc_observer.dart';
import 'package:islami_app/core/service/service_locator.dart';
import 'package:islami_app/core/service/shared_prefs_service.dart';
import 'package:islami_app/core/utils/app_const.dart';
import 'package:islami_app/features/pray/data/repo/azan_repo_impl.dart';
import 'package:islami_app/muslim_app.dart';

import 'package:path_provider/path_provider.dart';
//01018806383
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await HiveService.initHive();
  await SharedPrefsService.init();
  await LocalNotificationService.init();

  // Permissions and location must never block the app from starting.
  try {
    await LocalNotificationService.requestNotificationPermission()
        .timeout(const Duration(seconds: 10));
  } catch (e) {
    log("Notification permission error: $e");
  }
  try {
    await GetCurrentLocationService.determinePosition()
        .timeout(const Duration(seconds: 10));
  } catch (e) {
    log("Location error: $e");
  }
  try {
    if (SharedPrefsService.getData(AppConst.kIsPrayerLoaded) == true) {
      await AzanRepoImpl().scheduleTodayAdhan();
      log("=================================================Prayer loaded");
    }
  } catch (e) {
    log("Schedule adhan error: $e");
  }

  Bloc.observer = MyBlocObserver();
  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: HydratedStorageDirectory(
      (await getTemporaryDirectory()).path,
    ),
  );
  ServiceLocator.init();
  runApp(
    EasyLocalization(
      supportedLocales: [Locale('en'), Locale('ar')],
      path: 'assets/translations',
      fallbackLocale: Locale('ar'),
      child: const MuslimApp(),
    ),
  );
}
