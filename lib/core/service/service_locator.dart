import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';
import 'package:islami_app/core/api/api_consumer.dart';
import 'package:islami_app/core/api/api_keys.dart';
import 'package:islami_app/core/api/dio_consumer.dart';
import 'package:islami_app/core/service/get_current_location_service.dart';
import 'package:islami_app/features/hadith/data/model/hadith_model/hadith_model.dart';
import 'package:islami_app/features/hadith/data/repo/hadith_repo.dart';
import 'package:islami_app/features/hadith/domain/repo/hadith_repo_impl.dart';
import 'package:islami_app/features/pray/data/model/azkar_model/azkar_model.dart';
import 'package:islami_app/features/pray/data/model/pray_model/pray_model.dart';
import 'package:islami_app/features/pray/data/repo/azkar_repo_impl.dart';
import 'package:islami_app/features/pray/data/repo/pray_repo_impl.dart';
import 'package:islami_app/features/pray/domain/repo/azkar_repo.dart';
import 'package:islami_app/features/pray/domain/repo/pray_repo.dart';
import 'package:islami_app/features/quran/data/model/sura_audio_model/audio_details_model.dart';
import 'package:islami_app/features/quran/data/model/sura_details_model/sura_details_model.dart';
import 'package:islami_app/features/quran/data/model/sura_model/sura_model.dart';
import 'package:islami_app/features/quran/data/repo/quran_repo_impl.dart';
import 'package:islami_app/features/quran/domain/repo/quran_repo.dart';

GetIt getIt = GetIt.instance;

abstract class ServiceLocator {
  static void init() {
    getIt.registerSingleton<ApiConsumer>(DioConsumer(dio: Dio()));

    getIt.registerSingleton<QuranRepo>(
      QuranRepoImpl(
        suraBox: Hive.box<SuraModel>(ApiKeys.suraBox),
        api: getIt<ApiConsumer>(),
        suraDetailsBox: Hive.box<SuraDetailsModel>(ApiKeys.suraDetailsBox),
        audioBox: Hive.box<AudioDetailsModel>(ApiKeys.audioBox),
      ),
    );

    getIt.registerSingleton<HadithRepo>(
      HadithRepoImpl(
        api: getIt<ApiConsumer>(),
        hadithBox: Hive.box<HadithModel>(ApiKeys.hadithBox),
        hadithDetailsBox: Hive.box(ApiKeys.hadithDetailsBox),
      ),
    );
    getIt.registerSingleton<PrayRepo>(
      PrayRepoImpl(
        api: getIt<ApiConsumer>(),
        prayBox: Hive.box<PrayModel>(ApiKeys.prayBox),
      ),
    );
    getIt.registerSingleton<AzkarRepo>(
      AzkarRepoImpl(
        api: getIt<ApiConsumer>(),
        azkarMorningBox: Hive.box<AzkarModel>(ApiKeys.azkarMorningBox),
        azkarEveningBox: Hive.box<AzkarModel>(ApiKeys.azkarEveningBox),
      ),
    );
    getIt.registerSingleton<GetCurrentLocationService>(
      GetCurrentLocationService(),
    );
  }
}
